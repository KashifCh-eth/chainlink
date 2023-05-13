//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 ;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract chainlinkpricefeed{

    uint256 MinmumUSDBlance = 50 * 1e18 ;

    function fund() public payable {
        require(getConverstionRate(msg.value) >= MinmumUSDBlance , "not engh");
    }

    function getprice() public view returns(uint256){
       AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       (,int256 answer,,,) = pricefeed.latestRoundData();
       return uint256(answer * 1e10);
    }

    function getversion() public view returns(uint256) {
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return pricefeed.version();
    }
    function getConverstionRate(uint256 _EthAmount) public view returns(uint256) {
        uint256 ethAmount = getprice();
        uint256 ethAmountInUSD = (ethAmount * _EthAmount) / 1e18;
        return ethAmountInUSD;
    }

}
