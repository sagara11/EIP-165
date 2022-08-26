// SPDX-License-Identifier: UNLICENSED;
pragma solidity 0.8.4;

import "./interfaces/StoreInterface.sol";

contract Store is StoreInterface {
    uint256 internal value;

    function setValue(uint256 v) external override {
        value = v;
    }

    function getValue() external view override returns (uint256) {
        return value;
    }

    function supportsInterface(bytes4 interfaceId)
        external
        pure
        override
        returns (bool)
    {
        return interfaceId == 0x01ffc9a7 || interfaceId == 0x75b24222;
    }
}
