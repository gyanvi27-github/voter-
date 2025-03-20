// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {

    // Declare mapping to store votes for each candidate
    mapping(string => uint256) public votes;

    // Declare mapping to store token balances for participants
    mapping(address => uint256) public tokenBalance;

    // Declare event to emit when a vote is cast and tokens are rewarded
    event VoteCast(address indexed voter, string candidate, uint256 tokensRewarded);

    // Declare constant value for token reward
    uint256 constant TOKEN_REWARD = 10;

    // Declare function to cast a vote
    function vote(string memory candidate) public {
        // Increment the votes for the chosen candidate
        votes[candidate] += 1;

        // Reward the voter with tokens
        tokenBalance[msg.sender] += TOKEN_REWARD;

        // Emit an event when a vote is cast
        emit VoteCast(msg.sender, candidate, TOKEN_REWARD);
    }

    // Function to check the token balance of an address
    function checkBalance() public view returns (uint256) {
        return tokenBalance[msg.sender];
    }
}
