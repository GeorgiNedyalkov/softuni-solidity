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

 ## Problem 2. Agreement contract

 Writer a contract, that:
- [] Can accept ETH
- [] Has N number of owners (a list of owners given in a constructor)
- [] A proposal can be made to transfer the funds to an account (make it struct)
- [] For the proposal to be accepted, each owner must agree in the order defined in the list
 - [] For the second owner to agree, the first one has to agree first.
 - [] The same logic for all the owners
- [] If all agree within five munites of the proposal, the proposal is accepted and the funds are transferred
- [] Include all the necessary constraints

 ## Problem 3. Multiple coins contract
 
 Write a contract, that:
- [] Should store the balance of two coins (e.g. - RedCoin, GreenCoin)
 - [] You should compose the coins in a single struc
 - [] You should store the balances of both coins in a single ___
- [] The contract should have 10000 RedCoins and 5000 GreenCoins
- [] Have two functions that are used to send coins (one for RedCoin and another for GreenCoin)