# Lab: Data-Types

## Problem 1. State Contract

Write a contract, that:
 - [x] Has 3 kinds of states: locked, unlocked, restricted
 - [x] The owner can change the state
 - [x] Locked means nobody can call public contract functions (even fallback)
 - [x] Unlocked means that everybody can call contract functions
 - [x] Restricted means that only the owner can call contract functions
 - [x] Have a structure that contains a counter, a timestamp and an address
 - [x] Have a function that increments the counter by one, sets the current timestamp
 and sets the address to that of the caller