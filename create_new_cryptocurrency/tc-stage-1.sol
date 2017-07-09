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