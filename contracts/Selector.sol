// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;
import "./interfaces/StoreInterface.sol";

contract Selector {
    // 0x75b24222
    function calcStoreInterfaceId() external pure returns (bytes4) {
        StoreInterface i;
        return i.getValue.selector ^ i.setValue.selector;
    }
}
