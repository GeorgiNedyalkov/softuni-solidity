pragma solidity >=0.4.22 <0.6.0;

contract PokemonGame {
    // a few defined pokemons
    enum Pokemon {
        Arbok,
        Pikacu,
        Raichu,
        Sandshrew,
        Sanslash
    }

    // pokemon catch event. "Log" prefix is standard for event names
    event LogPokemonCaught(address indexed by, Pokemon indexed pokemon);

    struct Player {
        Pokemon[] pokemons;
        uint256 lastCatch; // timestamp
    }

    // link user address with a player
    mapping(address => Player) players;
    mapping(uint256 => address[]) pokemonHolders;

    // the hash of the pokemon holder and the pokemon is the key.
    mapping(bytes32 => bool) hasPokemonMap;

    modifier canPersonCatch(address person, Pokemon pokemon) {
        require(now > players[person].lastCatch + 15 seconds);
        require(!hasPokemon(person, pokemon));
        _;
    }

    // returns if that person caught a pokemon. It uses the hash of the address and the pokemon
    function hasPokemon(address person, Pokemon pokemon) internal view returns (bool) {
        return hasPokemonMap[(keccak256(abi.encodePacked(person, pokemon))]; 
    }

    function catchPokemon(Pokemon pokemon) public canPersonCatch(msg.sender, pokemon) {
        players[msg.sender].pokemons.push(pokemon);
        players[msg.sender].lastCatch = now;
        pokemonHolder[uint(pokemon)].push(msg.sender);
        hasPokemonMap[keccak256(abi.encodePacked(msg.sender, pokemon))] = true;

        emit LogPokemonCaught(msg.sender, pokemon);
    }

    function getPokemonByPerson(address person) public view returns (Pokemon[] memory) {
        return players[person].pokemons;
    }

    function getPokemonHolder(Pokemon pokemon) public view returns (address[] memory) {
        return pokemonHolders[uint(pokemon)];
    }
}