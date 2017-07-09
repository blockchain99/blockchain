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