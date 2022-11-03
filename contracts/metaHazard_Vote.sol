// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract metaH_Vote is ERC20, ERC20Permit, ERC20Votes {

    address private _owner;

    constructor() ERC20("metaH_Vote", "MH_V") ERC20Permit("metaH_Vote"){
        _owner = msg.sender;
        mint(_owner, 100);
    }

    function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address from, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._burn(from, amount);
    }

    function mint(address to, uint amount) public {
        require(msg.sender == _owner, "onlyOwner");
        _mint(to, amount);
    }

    function burn(address from, uint amount) public {
        require(msg.sender == _owner, "onlyOwner");
        _burn(from, amount);
    }

    function delegate(address to) public override {
        _delegate(msg.sender, to);
    }

    function transfer(address to, uint amount) public override returns(bool){
        super.transfer(to, amount);
        _afterTokenTransfer(msg.sender, to, amount);
        return true;
    }
}