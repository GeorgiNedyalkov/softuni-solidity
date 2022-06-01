pragma solidity >=0.4.22 <0.6.0;

contract PlanetEarth2 {
    // Storage
    mapping(string => string) capitals;
    mapping(string => bool) isCapitalUsed; // to check for duplicates

    // Enumerations
    enum continents {
        Asia,
        Africa,
        Europe,
        North_America,
        South_America,
        Australia,
        Antarctica
    }

    // Country
    struct country {
        bytes32 name;
        continents continent;
        uint16 populationInMillion; // here we can see the correct uintbytes to use
    }

    // Only countries in Europe added to this array
    country[] europeanCountries;

    // Get the country data
    function getEuropeanCountry(bytes32 name)
        public
        view
        returns (
            bytes32,
            uint8,
            uint16
        )
    {
        // Linear search to find the country
        for (uint8 i = 0; i < europeanCountries.length; i++) {
            if (name == europeanCountries[i].name) {
                return (
                    europeanCountries[i].name,
                    uint8(europeanCountries[i].continent),
                    europeanCountries[i].populationInMillion
                );
            }
        }
    }

    // Structure cannot be passed as argument, so we are passing all elements/ attributes of struct as args
    function addEuropeanCountry(
        bytes32 _name,
        uint8 _continent,
        uint16 _population
    ) public returns (bool) {
        if (_continent != uint8(continents.Europe)) return false;

        // declare the structure variable
        country memory country;

        // 3 ways to initialize the struct

        // #1. provide the attribute values in order that they appear in the declaration
        country = country(_name, continents(country), _population);

        // #2. use a json structure
        country = country({
            name: _name,
            continent: continents(country),
            populationInMillion: _population
        });

        // #3. use the . notation
        country.name = _name;
        country.continent = continents(country);
        country.populationInMillion = _population;

        // Push the country in the array
        europeanCountries.push(country);
        return true;
    }

    function addCapital(string memory countryCheck, string memory capital)
        public
    {
        require(isCapitalused[capital] == false);
        capitals[countryCheck] = capital;
        isCapitalUsed[capital] = true;
    }

    // returns the capital of the country
    function getCapital(string memory countryCheck)
        public
        view
        returns (string memory)
    {
        return capitals[countryCheck];
    }

    // Remove the key value pair from the mapping
    function removeCapital(string memory countryCheck) public {
        delete (capitals[countryCheck]);
    }

    // get the value at specified index
    function getContinent(uint8 arg) public pure returns (string memory) {
        if (arg == uint8(continents.Africa)) return "Africa";
        if (arg == uint8(continents.Asia)) return "Asia";
        if (arg == uint8(continents.Europe)) return "Erope";
        if (arg == uint8(continents.North_America)) return "North America";
        if (arg == uint8(continents.Sount_America)) return "South Amrerice";
        if (arg == uint8(continents.Antarctica)) return "Antarctica";
        if (arg == uint8(continents.Australia)) return "Australia";
    }
}
