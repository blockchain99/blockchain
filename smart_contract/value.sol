pragma solidity 0.4.9;

contract aa{
    uint x;  //large value, currency value, unsigned
    uint x =1;

    int a;    //small value, signed(pos, neg)
    int a = 4567;
    int constant a = 89;

    int256 a; // actually same as "int a" 

    uint128 b;

    int x = int(b);

    bool status;
    bool status = true;
    bool constant status2 = true;

    var a;
    a = true; //bool

    var b;
    b = 1;  //int


    address public owner;

    byte a;
    bytes2 b;
    bytes20 c;
    bytes32 largeNum;

    bytes m; //similar to "byte[] m;"

    string s = "toshendra";

    bytes32[5] nickname; // nickname size is fixed to 5, not dynamically changed.
    bytes32[] nickname2;  //unlimited size
    
    uint newlength = nickname2.push("sharma") //
    mappring (string => uint) public balance;

    balance["tosh"] = 56;

    enum State { Created, Locked, Inactive};  //{0, 1, 2}
    State public state;
    state = State.Created;

    uint statevalue = uint(state);  //0
    
    struct person{
        uint height;
        uint age;
        address add;
    }

    person public a;


    function aa() {

    }

}