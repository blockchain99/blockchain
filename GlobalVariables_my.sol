Pragma solidity 0.4.8;

contract GlobaVariables {

    //msg 
    address owner = msg.sender;
    uint amount = msg.value;
    bytes data = msg.data
    msg.gas, msg.sig

    // tx transaction data
    tx.origin;
    tx.gasprice;
    // block - block information

    block.number;
    block.difficulty;
    block.blockhash(1);
    block.gasLimit();
    block.conibase();

    assert(condition);
    assert(bool cond);
    assert(1 eth == 1000 finney);
    addmod(x,y,z); //(x+y%z)
    mulmod(x,y,z); //(x*y%d)
    sha3();
    keccak256();
    sha256("jhgjhg", "kjkh");
    sha3("ab","c") == sha3("abc");
    <address>.balance;
    addr.send(amount);




    //Define construct here
    function GlobalVariables() {
        // Initialize state variables here

    }
}