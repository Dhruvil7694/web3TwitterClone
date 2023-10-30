// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
 
contract status {
    uint256 constant MAX_CHARACTER_LENGTH = 140;

    mapping(address => string) public statuses;

    event StatusUpdated(
        address indexed user,
        string newStatus,
        uint256 timestamp
    );

    //we are making a fnunction for setting up out new Status
    function setStatus(string memory _status) public {
        require(
            bytes(_status).length < MAX_CHARACTER_LENGTH,
            "Status is out of bound"
        );
        statuses[msg.sender] = _status; // assigning the Status to the address who is executing this Status.
        emit StatusUpdated(msg.sender, _status, block.timestamp); //here i am updating the Status to the new Status with current block time stamp.
    }

    //a function to get the Status
    function getStatus(address _user) public view returns (string memory) {
        string memory status = statuses[_user]; 
        // we're gonna get out Status by mapping by providing our address and get return back our string which will stored in this Status variable

        if(bytes(status).length == 0){
            return "NO STATUS FOUND!!!";
        }
        else{
            return status;
        }
    }
}
