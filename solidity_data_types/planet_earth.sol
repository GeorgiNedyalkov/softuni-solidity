pragma solidity >=0.4.22 <0.6.0;

contract PlanetEarth {
    enum Continent {
        Asia,
        Africa,
        Europe,
        NorthAmerica,
        SouthAmerica,
        Australia,
        Antarctica
    }

    Continent continent;

    struct Country {
        string memory name;
        Continent continent;
        uint256 population;
    }

    mapping(string => Country) capitalCity;
    Country[] public europeanCountries;

    modifier onlyEuropean(Country country) {
        require(country.continent == continent.Europe);
        _;
    }

    function addCountry(
        string memory _name,
        Continent _continent,
        uint256 _population
    ) onlyEuropean {
        europeanCountries.push(country);
    }

    function addCapital(Country country, string memory capital) public {
        capitalCity[country] = capital;
    }

    function getCapital(Country country) public view returns (string memory) {
        return capitalCity[country];
    }

    // function that removes a capital
    function removeCapital(Country country) public {
        delete (capitalCity[country]);
    }

    // function that returns a string representation of each continent
    function getStringContinent(Continent continent)
        public
        view
        returns (string memory)
    {
        if (continent.Asia) return "Asia";
        else if (continent.Africa) return "Africa";
        else if (continent.NorthAmerica) return "North America";
        else if (continent.SouthAmerica) return "South America";
        else if (continent.Australia) return "Australia";
        else if (continent.Antarctica) return "Antarctica";
    }

    // function that returns all european countries

    function getEuropeanCountries() public view returns (Coutry[] memory) {
        return europeanCountries;
    }
}
