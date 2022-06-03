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

