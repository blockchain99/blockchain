pragma solidity 0.4.8;

contract CrowdFunder {

    //tosh-dev: 0x4EF89736C984A3f34aa5b7a9D57457faA837F258
    //main: 0xC8A908F248e930a705A70400146fcF24d3Cc7275
    //toshendra: 0xc8d21EB34E504Ef70AA075eA2a36F21cD3c1B685
    
    // Variables set
    address public creator;
    address public fundRecipient; // creator may be different than recipient
    uint public minimumToRaise; // required to tip, else everyone gets refund
    string campaignUrl;
    byte constant version = 1;

    // Data structures
    enum State {
        Fundraising,
        ExpiredRefund, // target is not achieved or other exception happend
        Successful,    //minimum target is achived
        Closed         //raised fund is transferred to fundRecipient
    } 
    struct Contribution {
        uint amount;
        address contributor;
    }

    // State variables
    State public state = State.Fundraising; // initialize on create
    uint public totalRaised;
    uint public currentBalance;
    uint public raiseBy;  //by the time funding shoud be done
    uint public completeAt; //time the last fund received.
    Contribution[] contributions;

    event LogFundingReceived(address addr, uint amount, uint currentTotal);
    event LogWinnerPaid(address winnerAddress);   //fundding is over successfully ether is transferred to fundRecipient
    event LogFundingSuccessful(uint totalRaised);
    event LogFunderInitialized(
        address creator,
        address fundRecipient,
        string url,
        uint _minimumToRaise, 
        uint256 raiseby);     //target date

    modifier inState(State _state) {   //which state this contract function must be at the time of function execution 
        if (state != _state) throw;
        _;  //otherwise execute function
    }

// only creator excute the function
    modifier isCreator() {
        if (msg.sender != creator) throw;
        _;
    }

    // Wait 1 hour after final contract state before allowing contract destruction
    modifier atEndOfLifecycle() {
        if(!((state == State.ExpiredRefund || state == State.Successful) && completeAt + 1 hours < now)) {
            throw;
        }
        _;  //if (ExpiredRefund state or Successful state) and current time stamp is 1 hour later than completed time. then this is atEndOfLifecycle()
    }

    function CrowdFunder(
        uint timeInHoursForFundraising,
        string _campaignUrl,
        address _fundRecipient,
        uint _minimumToRaise)
    {
        creator = msg.sender;
        fundRecipient = _fundRecipient;
        campaignUrl = _campaignUrl;
        minimumToRaise = _minimumToRaise * 1000000000000000000; //convert to wei
        raiseBy = now + (timeInHoursForFundraising * 1 hours);
        currentBalance = 0;
        LogFunderInitialized(
            creator,
            fundRecipient,
            campaignUrl,
            minimumToRaise,
            raiseBy);
    }

    function contribute()
    public
    inState(State.Fundraising) payable returns (uint256)   //using contribute() function, fund can be transferred to this contract.
    {
        contributions.push(
            Contribution({
                amount: msg.value,
                contributor: msg.sender
                }) // use array, so can iterate
            );
        totalRaised += msg.value;
        currentBalance = totalRaised;
        LogFundingReceived(msg.sender, msg.value, totalRaised);

        checkIfFundingCompleteOrExpired();
        return contributions.length - 1; // return id ex) if there are 8 contributions, it can be 0,1,2, ..7
    }

    function checkIfFundingCompleteOrExpired() {
        if (totalRaised > minimumToRaise) {
            state = State.Successful;
            LogFundingSuccessful(totalRaised);
            payOut();

            // could incentivize sender who initiated state change here
            } else if ( now > raiseBy )  {  //current time stamp is lager than time line(current time is passed )
                state = State.ExpiredRefund; // backers can now collect refunds by calling getRefund(id)
            }
            completeAt = now;   //updated as current time stamp.
        }

        function payOut()   
        public
        inState(State.Successful)  //if only funding is successful
        {
            if(!fundRecipient.send(this.balance)) {   //checking transferring the fund to fund recipient,  if sending is failed. 
                throw;
            }
            state = State.Closed;
            currentBalance = 0;  //funding is trasferred to the actual recipient
            LogWinnerPaid(fundRecipient);
        }

        function getRefund(uint256 id)   //everybody is allowed to get refunded using "id"
        public
        inState(State.ExpiredRefund) 
        returns (bool)
        {
            if (contributions.length <= id || id < 0 || contributions[id].amount == 0 ) {
                throw;
            }

            uint amountToRefund = contributions[id].amount;
            contributions[id].amount = 0;

            if(!contributions[id].contributor.send(amountToRefund)) {  //if sending is failed
                contributions[id].amount = amountToRefund;   //make refund back to original one ex) unit amountToRefund = contributions[id].amount;
                return false;  //no return has been done.
            }
            else{
                totalRaised -= amountToRefund;
                currentBalance = totalRaised;   //update current balance.
            }

            return true;
        }

        function removeContract()
        public
        isCreator()    //removeContract is carried by only creator
        atEndOfLifecycle()   //only excuted at end of lifecycle stage( expired or successful and 1hour lapse)
        {
            selfdestruct(msg.sender);
            // creator gets all money that hasn't be claimed
        }

        function () { throw; }  //default callback function
    }