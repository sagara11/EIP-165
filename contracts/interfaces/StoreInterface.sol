// SPDX-License-Identifier: UNLICENSED;
pragma solidity 0.8.4;

contract StoreInterfaceId {
    bytes4 internal constant STORE_INTERFACE_ID = 0xc5a23358;
}

abstract contract StoreInterface is StoreInterfaceId {
    function getValue() external view virtual returns (uint256);

    function setValue(uint256 v) external virtual;

    function IncreaseValue() external virtual returns (uint256);
}
