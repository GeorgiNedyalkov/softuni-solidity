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
- [x] Can accept ETH
- [x] Has N number of owners (a list of owners given in a constructor)
- [x] A proposal can be made to transfer the funds to an account (make it struct)
- [x] For the proposal to be accepted, each owner must agree in the order defined in the list
 - [x] For the second owner to agree, the first one has to agree first.
 - [x] The same logic for all the owners
- [x] If all agree within five munites of the proposal, the proposal is accepted and the funds are transferred
- [x] Include all the necessary constraints

 ## Problem 3. Multiple coins contract
 
 Write a contract, that:
- [x] Should store the balance of two coins (e.g. - RedCoin, GreenCoin)
 - [x] You should compose the coins in a single struc
 - [x] You should store the balances of both coins in a single mapping
- [x] The contract should have 10000 RedCoins and 5000 GreenCoins
- [x] Have two functions that are used to send coins (one for RedCoin and another for GreenCoin)

 ## Problem 4. Multiple coins contract vol.2


Write a contract that:
- [x] Should store the balance of multiple coins (e.g. - RedCoin, GreenCoin, Blue, Purple, Yellow, Violet, Indigo, etc.)
 - [x] You should store the balances of all coins in a mapping
- [x] The contract creator should have 10000 of each coin
- [x] Have one function that is used to send coins (think of a way to determine which coins you are sending)

## Problem 5. Pokemon Game

Create a Pokemon game, that:

- [] Knows 10 different type of Pokemons
- [] Any player can say that he caught a Pokemon, but maximum once per 15 seconds (personalized time)
- [] The contract can list which player possesses a Pokemon of ceratain type
- [] Watch out for duplicates

