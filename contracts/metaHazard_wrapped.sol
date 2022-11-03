// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Wrapper.sol";

contract MetaH_Wrapped is ERC20, ERC20Permit, ERC20Votes, ERC20Wrapper {

    IERC20 private _token;
    constructor(IERC20 wrappedToken) ERC20("MetaH_Wrapped", "MH_W") ERC20Permit("MetaH_Wrapped") ERC20Wrapper(wrappedToken){
        _token = wrappedToken;
    }

    function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20, ERC20Votes){
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20, ERC20Votes){
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal override(ERC20, ERC20Votes){
        super._burn(account, amount);
    }

    function burn(address from, uint amount) public {
        // require(msg.sender == _owner, "onlyOwner");
        _burn(from, amount);
    }
}

//0x3328358128832A260C76A4141e19E2A943CD4B6D