pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

// interface for subscription information
// this is intended to be a general interface to query a contract
// with arbitrary data
//
// the interface will return 0 if successful, otherwise it will
// return a user defined error code
//
// the function is declared view is looking at the status of the
// subscription should not change anything within the contract

interface ISubscriptionManager {
   function subscriptionStatus(address sender,
      string calldata dataString1,
      string calldata dataString2,
      uint256 dataInt,
      address dataAddress,
      bytes calldata dataBytes) external view returns
   (uint256 errorCode);

   function isAccessible(uint256 productId, address user) external view returns (bool accessible);
   function addNewSubscriber(uint256 productId, address payer, address clientAddr, uint256 expiredDate) external;
   function extendSubscriptionPeriod(uint256 productId, address payer, uint256 expiredDate) external;
   function updateClientAddressBySubscriber(uint256 productId, address clientAddr) external;
   function getVersion() external pure returns (uint256);
}




