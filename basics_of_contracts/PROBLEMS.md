# Lab Exercises: Basics of Contracts

## Problem 1. Contract ownership

Write a contract, that:
 - [x] knows its owner (contract publisher)
 - [x] has a method that ** changes the owner **
  - [x] can ** only be called by the current owner **
  - [x] the method takes one argument - ** address ** of the new owner
  - [x] at each owner change, a contract ** event is created ** with two fields -
  ** the old ** and ** new owner **
 - [x] has a method that accepts ownership
  - [x] can only be executed by the address that is set from the method that changes the owner
  - [x] the onwer has only 30 seconds to accept the ownership
 - [x] the fallback function shall emit an event with the ** sender ** and the ** value ** send
 with the transationc (amount of Ethers) 

 ## Problem 2. Auction

 The bulgarian government wants to sell the Bulgarian Railways and they want to use Ethereum
 Smart Contract for the auction. Your job is to provide a smart contract that can handle
 the auction without any financial fraud and "shurobadjanashtina".

 Create an auction contract, that:

- [x] Has an owner
- [x] Has a method to place bid
 - [x] The auction should not be cancelled or expired
 - [x] Should accept ETH
 - [x] Everyone except the owner can place new bid.
 - [x] The bid should be greater than the highest bid otherwise the function should throw an exception
- [x] Has a method to check the highest bid and the highest bidder
 - [x] use the correct function modifier
- [x] Has a method to cancel the auction
 - [x] Only the owner can cancel the auction
- [x] Has a method to withdraw funds
 - [x] Should send ETH
 - [x] If the auction is cancelled everyone can withdraw their bid
 - [x] If the auction is not cancelled but it's expired, then the owner of the auction can withdraw the
 highest bidder bid. Everyone else can withdraw their bid.
 - [x] Every method should emit an event
 - [x] Use assert and require whenever possible 
 - [x] The constructor shall receive 2 parameters - start time and end time
  - [x] You need to validate them correctly. Think about it.
- [x] Create custom modifier which will help you with all functions


# HomeWork: Intro to Ethereum and Smart Contracts

1. Problem 1. Improve the Auction contract

Add the following functionality
 - [] Add functionality which requires a minimum bid difference between the highest bid
 and the new bid. For example: current bid is 5, the next should be 10, then 15... etc.
 - [] The value of the big margin should be included in the constructor.
 - [] If someone has placed a bid, he can do it again after 1 hour.


2. Service Marketplace

Create a contract, that:
 - [] Has a method to buy a certain service. The service costs 1 ETH.
 - [] If the money sent are more than 1 ETH the contract will return the extra back.
 - [] The contract confirms that the person bought the service by emitting an event.
 - [] Nobody can buy the service for 2 minutes after someone bought it. Use a custome function modifier.
 - [] Use assert and require whenever possible.
 - [] The owner of the contract can withdraw the money once per hour and maximum of 5 ETH at a time.