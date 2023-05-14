//SPDX-License-Identifier:MIT
pragma solidity^0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract priceFeedDemo {
  
   AggregatorV3Interface internal pricefeed ;

    constructor(address _address){
       pricefeed = AggregatorV3Interface(_address);
    }

    function getPriceOfETH() public view returns(uint256) {
       (,int256 price,,,) = pricefeed.latestRoundData();
       return uint256(price * 1e10);
    }

}
