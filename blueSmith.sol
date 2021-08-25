pragma solidity ^0.4.17;

contract Inbox {
    string public message;
    address[] public members;
    mapping(string => uint) tokens;
    
    function Inbox(string initialMessage) public {
        message = initialMessage;
    }    
    
    function setMessage(string newMessage) public {
        message = newMessage;
    }
    
    function register() public payable {
        require(msg.value > .01 ether);
        
        members.push(msg.sender);
    }
    
    function getToken() public  view  returns (string tokenValue) {
      uint _i = uint256(msg.sender);
      if (_i == 0) {
          return "0";
      }
      uint j = _i;
      uint len;
      while (j != 0) {
          len++;
          j /= 10;
      }
      bytes memory bstr = new bytes(len);
      uint k = len - 1;
      while (_i != 0) {
          bstr[k--] = byte(uint8(48 + _i % 10));
          _i /= 10;
      }
      return string(bstr);
    }
    
    function payToken(uint value) public payable {
        require(msg.value == value);
        tokens[getToken()] = msg.value;
    }
    
    function getTokenValue(string input) public view returns (uint){
        return tokens[string(input)];
    }

}
