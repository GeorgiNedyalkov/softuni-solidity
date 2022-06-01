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

- [x] Knows 10 different type of Pokemons
- [x] Any player can say that he caught a Pokemon, but maximum once per 15 seconds (personalized time)
- [x] The contract can list which player possesses a Pokemon of ceratain type
- [x] Watch out for duplicates


# Homework

## Problem 1. Crowdsale Contract

Create people balances contract.

- [x] The contract holds the account balance and the balance is represented by an integer
- [x] The contract has states:
 - [x] Crowdsale state - in the first 5 minutes, where people can buy the token at a rate of 5 Tokens / 1
 ETH. People cannot transfer during this period.
 - [x] Open exchange state - after that period where people can transfer the tokens.
- [x] Minimum investment 1 ETH
- [x] Accept only round ETH (i.e. cannot send 0.5 or 1.7 ETH)
- [x] The contract owner can withdraw the funds after 1 year
- [x] For each token holder there should be a boolean flag that shows if that person holds or even held tokens
- [x] There should be an array that contains all current and past token holders
- [] Emit events where you think it's appropriate

## Problem 2. Planet Earth Contract

Create a contract that:

- [x] Declares all continents (Europe, Asia, etc.) Use the best way to declare them -
we know that there is a fixed amount of continents and we know their names.
- [x] Declares a data representing a single country (name, continent, population) 
- [x] Keep track of each country's capital, so people can check country's capital by simply
giving a name 
- [x] Store only European countries
- [x] Have a function to add country (should accept only European countries). The function accepts
all countrie's properties (name, continent, population)
- [x] Have a function to add capital to a single country (No duplicates - i.e. Sofia cannot be a capital of both Bulgaria and Romania)
- [x] Have a function that gives the capital by a given name
- [x] Have a function to remove a capital
- [x] Have a function that returns the string representation of each continent (i.e. "Asia", "Europe", etc.)
- [x] Have a function that returns all European countries

## Problem 3. Simple Token Contract

Create contract that represents a token with the following characteristics:
- [x] The token has name.
- [x] The token has symbol.
- [x] The token has decimals (e.g. decimals = 2, value 100 should be interpreted as 1.00)
- [x] Keep track of user balances
- [x] Has a total supply (the total number of tokens that exists)
 - [x] The total supply should be given as a parameter to the constructor
 - [x] The total supply shoudl be assigned to the contract creator
 - [x] Keep in mind the decimals
- [x] The contract should NOT accept ETH. Penalize everyone who is trying to send ethers to the contract.
- [x] Have a function that transfers a number of tokens to another address
- [x] Emit events when appropriate