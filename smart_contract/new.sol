pragma solidity 0.4.8; 

/*
* @title Example for Learn Solidity - Build Decentralized Applications on Blockchain
* @author Ethereum Community
* @notice Example for the Solidity Course
*/
contract D {
    uint x;
    function D(uint a) payable {
        x = a;
    }
}


contract C {
    D d = new D(4); // will be executed as part of C's constructor

    function createD(uint arg) {
        D newD = new D(arg);
    }

    function createAndEndowD(uint arg, uint amount) {
        // Send ether along with the creation
        D newD = (new D).value(amount)(arg);
    }
}