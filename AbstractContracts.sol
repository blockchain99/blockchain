pragma solidity 0.4.8;

contract Feline {
    function utterance() returns (bytes32);
}

contract Cat is Feline {
    function utterance() returns (bytes32) { return "miaow"; }
}


