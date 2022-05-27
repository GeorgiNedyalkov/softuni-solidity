# Lab: Data-Types

## Problem 1. State Contract

Write a contract, that:
 - [] Has 3 kinds of states: locked, unlocked, restricted
 - [] The owner can change the state
 - [] Locked means nobody can call public contract functions (even fallback)
 - [] Unlocked means that everybody can call contract functions
 - [] Restricted means that only the owner can call contract functions
 - [] Have a structure that contains a counter, a timestamp and an address
 - [] Have a function that increments the counter by one, sets the current timestamp
 and sets the address to that of the caller