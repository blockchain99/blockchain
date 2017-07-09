### New Cryptocurrency TCoin
In this course, We will learn solidity program to make a new cryptocurrency, called TCoin on top of Ethereum Blockchain using
Solidity Programming Language.

#### Features of TCoin
> Coin must be called TCoin and must have the symbol as TC

> Creator must be able to specify the initial supply during the creation.

> Users must be able to transfer the coins to other people’s account.

> Debt or negative balance should not be allowed.

> There should be be one administrator who may or may not be the currency creator. ie.

> currency creator must make someone as admin during the creation.

> Anyone must be able to buy or sell the TCoins using ethers.

> Buy or sell price must be set by Admin at any time.

> Admin must be able to transfer the administrator role to any other address

> Admin must be able mint the new TCoins to anyone’s address

> Admin must be able to freeze or unfreeze the coins of anyone’s account.

> Proof-of-work must be there for the consensus.

> Miner must be challenged and must be rewarded a new TCoin of every block he/she mine for every 1 minute since last block.

> Mining difficulty must be adjusted up or down to target an average of 10 minutes per reward.


## Code for new Coin : stage 1
''js
pragma solidity 0.4.8;
contract TCoin{

    mapping (address=>unit256) public balanceOf;
    //balanceOf[address] = 5;
    
    function TCoin(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, uint256 _value){
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

    }
}
''''

## Code for new Coin : Stage 2
'''js
pragma solidity 0.4.8;
contract TCoin{

    mapping (address=>unit256) public balanceOf;
    //balanceOf[address] = 5;
    mapping (address => (address => uint256)) public allowance;  // i autorized my friend( address), ceratain amount of money to use.
    string public standard  = "TCoin v1.0";
    string public name;
    string public symbol;
    uint8 public decimal; //1.23, 1.567
    uint256 public totalSupply;
    // help to log trasfering data
    event Transfer(address indexed from, address indexed to, uint256 value); //store in log memory not contract data

    function TCoin(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 deimalUnits) {
        balanceOf[msg.sender] = initialSupply;
        totalSupply = initialSupply;
        decimal = deimalUnits;
        symbol = tokenSymbol;
        name = tokenName;
    }

    function transfer(address _to, uint256 _value){
        // if current's balance is less than the _value to transfer
        if(balanceOf[msg.sender] < _value) throw;
        // if overflow: 0-255, if 250+10 makes 4 rather than 260: overflow
        if(balanceOf[_to] + _value < balanceOf[_to]) throw; // 4 < 260
        // old value token plus newly add value token shoud be greater than old value token

        balanceOf[msg.sender] -= _value;  //(balanceOf[msg.sender] : balanceOf[address]) makes token value
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value)
    }
    function approve(address _spender, uint256 _value) returns (bool success){
        allowance[msg.sender][_spender] = _value;
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success){
        if(balanceOf[_from] < _value) throw;
        if(balanceOf[_to] + _value < balanceOf[_to]) throw;
        //prerson is not authrized to transfer that much
        // allowance[_from] : person who is authorized, [msg.sender] : sender
        // allowance[address][address]
        if(_value > allowance[_from][msg.sender]) throw;
        balanceOf[_from] -= _value; 
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;

    }
}
''''

## Code for new Coin : Stage 3
'''js
pragma solidity 0.4.8;

contract admined {
    address public admin;

    function admined() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        if(msg.sender != admin) throw;
        _;
    }

    function trasferAdminship(address newAdmin) onlyAdmin {
        admin = newAdmin;
    } 
}

contract TCoin{

    mapping (address=>unit256) public balanceOf;
    //balanceOf[address] = 5;
    mapping (address => (address => uint256)) public allowance;  // i autorized my friend( address), ceratain amount of money to use.
    string public standard  = "TCoin v1.0";
    string public name;
    string public symbol;
    uint8 public decimal; //1.23, 1.567
    uint256 public totalSupply;
    // help to log trasfering data
    event Transfer(address indexed from, address indexed to, uint256 value); //store in log memory not contract data

    function TCoin(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 deimalUnits) {
        balanceOf[msg.sender] = initialSupply;
        totalSupply = initialSupply;
        decimal = deimalUnits;
        symbol = tokenSymbol;
        name = tokenName;
    }

    function transfer(address _to, uint256 _value){
        // if current's balance is less than the _value to transfer
        if(balanceOf[msg.sender] < _value) throw;
        // if overflow: 0-255, if 250+10 makes 4 rather than 260: overflow
        if(balanceOf[_to] + _value < balanceOf[_to]) throw; // 4 < 260
        // old value token plus newly add value token shoud be greater than old value token

        balanceOf[msg.sender] -= _value;  //(balanceOf[msg.sender] : balanceOf[address]) makes token value
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value)
    }
    function approve(address _spender, uint256 _value) returns (bool success){
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success){
        if(balanceOf[_from] < _value) throw;
        if(balanceOf[_to] + _value < balanceOf[_to]) throw;
        //prerson is not authrized to transfer that much
        // allowance[_from] : person who is authorized, [msg.sender] : sender
        // allowance[address][address]
        if(_value > allowance[_from][msg.sender]) throw;
        balanceOf[_from] -= _value; 
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }
}
// since we don't want contract TCoin inherite from   (such as : "contract TCoin is admined")
// but we do not want modigy TCoin , so make new contract. 
// merge into TCoinAdvanced from admined, TCoin
contract TCoinAdvanced is admined, TCoin{
    uint256 minimunBalanceForAccounts = 5 finney;
    uint256 public sellPrice;
    uint256 public buyPrice;


//freeze (not allowed to transfer fund) or unfreeze the coins of anyone's account  
    mapping (address => bool) public frozenAccount;

    event FrozenFund(address target, bool frozen);

    function TCoinAdvanced(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 decimalUnits, address centralAdmin) TCoin (0, tokenName, tokenSymbol, deimalUnits ){
        totalSupply = initialSupply;
        if(centralAdmin != 0)
            admin = centralAdmin;
        else
            admin = msg.sender;
        balanceOf[admin] = initialSupply;
        totalSupply = initialSupply;
    }
    function mintToken(address target, uint256 mintedAmount) onlyAdmin{
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        Transfer(0, this, mintedAmount);
        Transfer(this, target, mintedAmount);
    }

    function freezeAccount(address target, bool freeze) onlyAdmin{
        frozenAccount[target] = freeze;
        FrozenFund(target, freeze);  //event 
    }

    function transfer(address _to, uint256 _value){
        if(msg.sender.balance < minimunBalanceForAccounts)
        sell((minimunBalanceForAccounts - msg.sender.balance)/sellPrice)
        if(freezeAccount[msg.sender]) throw;
        // if current's balance is less than the _value to transfer
        if(balanceOf[msg.sender] < _value) throw;
        // if overflow: 0-255, if 250+10 makes 4 rather than 260: overflow
        if(balanceOf[_to] + _value < balanceOf[_to]) throw; // 4 < 260
        // old value token plus newly add value token shoud be greater than old value token

        balanceOf[msg.sender] -= _value;  //(balanceOf[msg.sender] : balanceOf[address]) makes token value
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value)
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success){
        if(freezeAccount[_from]) throw;
        if(balanceOf[_from] < _value) throw;
        if(balanceOf[_to] + _value < balanceOf[_to]) throw;
        //prerson is not authrized to transfer that much
        // allowance[_from] : person who is authorized, [msg.sender] : sender
        // allowance[address][address]
        if(_value > allowance[_from][msg.sender]) throw;
        balanceOf[_from] -= _value; 
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }

    function setPrices(unit256 newSellPrice, uint256 newBuyPrice) onlyAdmin{
        sellPrice = newSellPrice;
        buyPrice = newBuyPrice;
    }
    //People specify how much buy TCoin using ether they sending by buy function.
    //user(executer, meg.sender) sendt ether to smartcontract, smartcontract take ether and then send TCoin in it's pocket to buyer's account
    // people send ether using this buy method.

/*  wei (specifically msg.value):The base unit for currency in Solidity is Wei. you can specify units explicitly: wei, finney, szabo and ether.
1. contracts should store balances in wei (to avoid division and rounding inaccuracies)
2. contracts should keep computation to a minimum (since paying a miner is much more expensive than performing the same computation locally)
3. data conversions are an example of computation that should be done by the frontend locally (instead of by a contract on the blockchain) 
*/
// msg.value/(1 ether) - convert TCoin to ether
    function buy() payble {   // smartcontract(seller) 
        uint256 amount = (msg.value/(1 ether))/buyPrice;
        if(balanceOf[this] < amount) throw; //check whether smartcotract has enough TCoin to sell ,ex)sarmtcontract try to sell 5 Tcoins,but smartcontract has only 1 TCoin 
        balanceOf[msg.sender] += amount;  //sender's balance
        balanceOf[this] -= amount; //smartcotract's balance
        Transfer(this, msg.sender, amount);
    }

    function sell(uint256 amount) {   //smartcontract (buyer)
        if(balanceOf[msg.sender] < amount) throw; //check whether seller(msg.sender) has enough TCoin in his pocket 
        balanceOf[this] += amount;
        balanceOf[msg.sender] -= amount;
        //check whether sender  actually receive particular ether.
        if(!msg.sender.send(amount * sellPrice * 1 ether)){
            throw;
        }
        else {
            Transfer(msg.sender, this, amount);
        }
    }
    // in order to give ethereum to the minder mined new block , we need to generate address of the block for the minder.
    function giveBlockreward(){
        balanceOf[block.coinbase] += 1;  //block.coinbase: the adress of miner who just minded new block
    }

    bytes32 public currentChallenge;    // The coin starts with a challenge
    uint public timeOfLastProof;        // Variable to keep track of when rewards were given
    uint public difficulty = 10**32;

//PoW algorithm is to ensure that only the decided number of blocks are made in a time frame and we adjust difficulty accordingly.
    function proofOfWork(uint nonce){
        bytes8 n = bytes8(sha3(nonce, currentChallenge));  // Generate a random hash(currentChallenge) based on input
        if(n < bytes8(difficulty)) throw;
        uint timeSinceLastBlock = (now - timeOfLastProof);  // Check if it's under the difficulty,Calculate time since last reward was given
        if(timeSinceLastBlock < 5 seconds) throw;  //Rewards cannot be given too quickly

        balanceOf[msg.sender] += timeSinceLastBlock / 60 seconds;  //reward every single minute, The reward to the winner grows by the minute
        difficulty = difficulty * 10 minutes / timeOfLastProof + 1;  //difficulty adjusted so that new block mined every 10 minutes.
        timeOfLastProof = now;
        currentChallenge = sha3(nonce, currentChallenge, block.blockhash(block.number-1))  //hash of recently mined block, Save a hash that will be used as the next proof

    }
}  

''''
