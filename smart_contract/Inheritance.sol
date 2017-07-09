pragma solidity 0.4.8;

contract owned {
    function owned() { owner = msg.sender; }
    address owner;
}

contract mortal is owned{
    function kill() {
        selfdestruct(owner);
    }
}

// Multiple inheritance is possible. Note that "owned" is
// also a base class of "mortal", yet there is only a single
// instance of "owned" (as for virtual inheritance in C++).

/* contract User is mortal, owned */ // compille error 
contract User is owned, mortal{
    string public UserName;

    function User(string _name){
        UserName = _name;
    }
}



