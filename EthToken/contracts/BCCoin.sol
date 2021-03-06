
pragma solidity ^0.4.21;

import "./Interface.sol" ;           // change this line


contract BCCoin is Interface {

    uint256 constant private MAX_UINT256 = 2**256 - 1;
    // declare balances variable here
    mapping (address => mapping (address => uint256)) public allowed;
    mapping(address => uint256)  public balances;
   
    string public name;                   //fancy name: eg Simon Bucks
    uint8 public decimals;                //How many decimals to show.
    string public symbol;                 //An identifier: eg SBX
    uint8 public tokenValue;              //token value in ethers
    address public Owner;                 //address account who deplyed the contract 



    constructor ( uint256 _initialAmount,string _tokenName,uint8 _decimalUnits,string _tokenSymbol,uint8 _tokenValue) public {
       Owner = msg.sender;
       // your code here
       balances[Owner] = _initialAmount; 
       name = _tokenName;
       decimals = _decimalUnits;
       symbol = _tokenSymbol;
       tokenValue =  _tokenValue;
}


    function transfer(address _to, uint256 _value) public  {

        balances[msg.sender] = balances[msg.sender] -_value;
        balances[_to] = balances[_to] + _value;
    }
    

    function transferFrom(address _from, address _to, uint256 _value) public  {
        uint256 allowance = allowed[_from][msg.sender];
        // your code here
        balances[_from] = balances[_from] - _value;
        allowed[_from][msg.sender] = allowed[_from][msg.sender] +_value;
        balances[_to] = balances[_to] + _value;
         
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
     
    }    
   
    function approve(address _spender, uint256 _value) public  {
       // your code here 
       allowed[msg.sender][_spender] = _value;
    }

   function getTokens() public payable {
           uint256 wltamount = msg.value/tokenValue;
           balances[Owner]=balances[Owner]-wltamount;
           balances[msg.sender]=balances[msg.sender]+wltamount;
}
function getBalance() public returns(uint256) {
           return msg.sender.balance;
}
function getEthers(uint256 _token) public {
    uint256 etherAmount = _token*tokenValue;
    balances[msg.sender] -= _token;
    balances[Owner] += _token;
    msg.sender.transfer(etherAmount);
}
}   