# Lab Exercises: Basics of Contracts

## Problem 1. Contract ownership

Write a contract, that:
 - [] knows its owner (contract publisher)
 - [] has a method that ** changes the owner **
  - [] can ** only be called by the current owner **
  - [] the method takes one argument - ** address ** of the new owner
  - [] at each owner change, a contract ** event is created ** with two fields -
  ** the old ** and ** new owner **
 - [] has a method that accepts ownership
  - [] can only be executed by the address that is set from the method that changes the owner
  - [] the onwer has only 30 seconds to accept the ownership
 - [] the fallback function shall emit an event with the ** sender ** and the ** value ** send
 with the transationc (amount of Ethers) 