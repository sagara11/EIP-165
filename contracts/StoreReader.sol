// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;

import "./interfaces/StoreInterface.sol";
import "./ERC165Query.sol";

contract StoreReader is StoreInterfaceId, ERC165Query {
    StoreInterface store;

    constructor(address storeAddress) {
        require(
            doesContractImplementInterface(storeAddress, STORE_INTERFACE_ID),
            "Doesn't support StoreInterface"
        );
        store = StoreInterface(storeAddress);
    }

    function readStoreValue() external view returns (uint256) {
        return store.getValue();
    }
}
