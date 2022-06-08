# Lab: Inheritance and Multiple Contracts

## Problem 1. Master | Agent contract

Create a master contract, that:

- [x] Can create agents
- [x] Can give orders to agent
 - [x] The agent must be one created or approved by this master
- [x] The master contract owner can tell the master to create or approve an agent
- [x] Can query an agent by asking if the order is done
- [x] Create an agent contract
 - [x] it must have a method to receive and query an order from master an only from it
- [x] For this case, create one agent which can accept only one order - wait 15 seconds. 
the order is done (the query function returns true) if 16 have passed since the order placement

# Homework: Inheritance and Multiple Contracts

Create a contract, that: 
- [] Is Owned
- [] Can be killed
- [] Uses safe math operations
- [] has members (people that are members of the contract)
- [] The owner is the first member
- [] The owner can remove members
- [] To add a new member, there need to be voting
 - [] If >50% of the members agree, the new member is added
- [] For each member we hold: 
 - His address
 - ETH donated to the contract
 - Timestamp of last donation
 - Value of last ETH donation
- []  A member can be removed from the contract if he hasn't donated to the contract in the last 1 hour
- [] Use a library for all member related actions
- [] Bonus if you don't use any arrays or loops 