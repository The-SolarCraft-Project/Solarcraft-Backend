// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ETHtoUSDConverter {
    AggregatorV3Interface internal dataFeed;

    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    function getVersion() public view returns (uint256) {
        return dataFeed.version();
    }

    function getLatestData() public view returns (uint256) {
        (, int answer, , , ) = dataFeed.latestRoundData();
        return uint256(answer);
    }

    function getConversionRate(
        uint256 gweiAmount
    ) public view returns (uint256) {
        uint256 ethPrice = getLatestData();
        uint256 price = ethPrice * gweiAmount;
        uint256 totalPrice = price / 1e17;
        return totalPrice;
    }
}
