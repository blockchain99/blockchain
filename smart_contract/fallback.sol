pragma solidity 0.4.8; 

/*
* @title Example for Learn Solidity - Build Decentralized Applications on Blockchain
* @author Ethereum Community
* @notice Example for the Solidity Course
*/
/*function () { ... } inside Solidity contracts? How can a function not have a name?
This function is called “fallback function” and it is called when someone just sent Ether to the contract without providing any data or 
if someone messed up the types so that they tried to call a function that does not exist.

The default behaviour (if no fallback function is explicitly given) in these situations is to throw an exception.

If the contract is meant to receive Ether with simple transfers, you should implement the fallback function as

function() payable { }

Another use of the fallback function is to e.g. register that your contract received ether by using an event.

Attention: If you implement the fallback function take care that it uses as little gas as possible, because send() will only supply a limited amount.

Is it possible to pass arguments to the fallback function?
The fallback function cannot take parameters.

Under special circumstances, you can send data. If you take care that none of the other functions is invoked, you can access the data by msg.data.
*/
contract fallBAck {
  // this fallback function is default function(try execute something that does not access), receive everything, but do nothing
    function() {
        throw;
    }
  //modifier payable: can receive fund but no way to recocery back
    function() payable {

    }
}


contract Test {
    // This function is called for all messages sent to
    // this contract (there is no other function).
    // Sending Ether to this contract will cause an exception,
    // because the fallback function does not have the "payable"
    // modifier.
    function() { x = 1; }
    uint x;
}


// This contract keeps all Ether sent to it with no way
// to get it back.
contract Sink {
    function() payable { }
}


contract Caller {
    function callTest(Test test) {
        test.call(0xabcdef01); // hash does not exist
        // results in test.x becoming == 1.

        // The following call will fail, reject the
        // Ether and return false:
        test.send(2 ether);
    }
}