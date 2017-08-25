pragma solidity ^0.4.13;

contract MyToken {

    /* Public variables of the token*/
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;


    /*Creates an array with all balances*/
    mapping (address => uint256) public balanceOf;

    /*Generates a public event on blockchain that will notify clients*/
    event Transfer(address indexed from, address indexed to, uint256 value);

    /*Initializes contract with initla supply tokens to the creator of the contract*/
    function MyToken(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) {
        balanceOf[msg.sender] = initialSupply; //Give creator all initial tokens
        totalSupply = initialSupply;
        name = tokenName; //Set the name for display purposes
        decimals = decimalUnits; //Amount of decimals for display purposes
        symbol = tokenSymbol; //Set symbol for display purposes
    }

    /*Send coins*/
    function transfer(address _to, uint256 _value) {
      /* Check if sender has enough coins and for balance overflows*/
      require(balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to]);
      /*Add and subtract new balances*/
      balanceOf[msg.sender] -= _value;
      balanceOf[_to] += _value;
    }

}
