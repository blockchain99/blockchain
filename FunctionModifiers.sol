pragma solidity 0.4.8; 

/*
* @title An Example for Solidity Course
* @author Toshendra Sharma
* @notice Example for the Solidity Course
*/
//modifier: check the condition before executing or before function call, save gas
contract FunctionModifiers {

	address public creator;
    // Define consutruct here
    function FunctionModifiers() {
       // Initialize state variables here
       creator = msg.sender;
    }

    modifier onlyCreator() {
        if (msg.sender != creator) throw;
        _;  // resume the function exceution whenever this modifier is used
    }

    function kill() onlyCreator { //check the feasibility of function before using gas.
    	selfdestruct(creator);
    }

}