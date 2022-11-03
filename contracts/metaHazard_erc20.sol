// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract metaH_ERC20 is ERC20 {
    constructor() ERC20("metaH_ERC20", "MH_E"){
        _mint(msg.sender, 100);
    }
}