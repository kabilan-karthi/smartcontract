pragma solidity ^0.8.0;

contract SimpleContract {
    address private owner;
    uint public contractValue;

    event ValueChanged(uint newValue);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }

    function setValue(uint newValue) public onlyOwner {
        contractValue = newValue;
        emit ValueChanged(newValue);
    }

    function getValue() public view returns (uint) {
        return contractValue;
    }
}
