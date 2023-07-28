// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OscarToken{
    string public name;
    string public symbol;
    uint256 public TotalSupply;
 
    mapping(address => uint256) public balance;

    address public owner;

    modifier onlyOwner(){
        require(msg.sender == owner, "only conttract owner can call this function");
        _;
    }

    constructor(){
        name = "OSCAR";
        symbol = "OSC";
        owner = msg.sender;
    }

    function mint(address to, uint amount) external onlyOwner {
        require(to!=address(0), "Invalid address");
        TotalSupply += amount;
        balance[to] += amount; 
    }

    function burn(uint256 amount) external {
        require(amount>0, "invalid amount");
        require(balance[msg.sender] >= amount, "insufficient balance");
        TotalSupply -= amount;
        balance[msg.sender] -= amount;
    }

    function transfer(address to, uint amount) external {
        require(to!=address(0), "invalid address");
        require(amount>0, "inavlid amount");
        require(balance[msg.sender] >= amount, "insufficient balance");
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

}