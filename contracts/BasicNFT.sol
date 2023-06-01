// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract BasicNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event ItemOwned(address indexed owner, uint256 indexed tokenId);

    constructor() ERC721("Celestial Bodies", "CB") {}

    function mintNFT(
        address receipient,
        string memory tokenURI
    ) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(receipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        emit ItemOwned(msg.sender, newItemId);
        return newItemId;
    }
}
