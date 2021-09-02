pragma solidity ^0.4.17;

contract Factory {
    address[] public ConnectedUsers;
        function StoringAdress (string USERNAME, string PASSWORD) public {
                address newUsers = address (new BlueSmith( USERNAME, PASSWORD));
                ConnectedUsers.push(newUsers);
        }
        
        function getMoney (uint money) private {
            address ownerbhaiya = 0x4C5C34262C543e10C79a1160D5D974375486C62a;
            require(msg.sender == ownerbhaiya);
            ownerbhaiya.transfer(money);
        }
        
        function getUsers() public view returns (address []) {
            return ConnectedUsers;
        }
}

contract BlueSmith {
    string public userName;
    string public userPassword;
    address[] public members;
    mapping(address => bool) IsHeMember;
    mapping(string => uint) tokens;
    
    function BlueSmith(string USERNAME, string PASSWORD) public {
        userName = USERNAME;
        userPassword = PASSWORD;
        
    }    
    
    function changePassword(string newPassword) public {
        userPassword = newPassword;
    }
    
    function register() public payable {
        require(msg.value > .01 ether);
        IsHeMember[msg.sender] = true;
        members.push(msg.sender);
    }
    
    function getToken() public  view  returns (string tokenValue) {
        require(IsHeMember[msg.sender]);
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
        require(IsHeMember[msg.sender]);
        require(msg.value == value);
        tokens[getToken()] = msg.value;
    }
    

    function getTokenValue(string input) public view returns (uint){
        require(IsHeMember[msg.sender]);
        return tokens[string(input)];
    }

}
