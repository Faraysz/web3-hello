// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWeb3 {
    string public message = "Halo Dunia Web3!";

    function setMessage(string calldata _msg) public {
        message = _msg;
    }
}

