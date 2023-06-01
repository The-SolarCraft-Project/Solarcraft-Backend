// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NftStorage {
    struct Object {
        address nftAddress;
        uint256 tokenId;
        bool enable;
        uint16 scale;
        uint16 speed;
        int16 x;
        int16 y;
        int16 z;
    }

    mapping(address => mapping(uint256 => Object)) private s_nftObjects;

    event ItemAdded(
        address indexed owner,
        address indexed nftAddress,
        uint256 indexed tokenId,
        bool enable,
        uint16 scale,
        uint16 speed,
        int16 x,
        int16 y,
        int16 z
    );

    function addNFT(
        address _nftAddress,
        uint256 _tokenId,
        uint16 _scale,
        uint16 _speed,
        int16 _x,
        int16 _y,
        int16 _z
    ) external {
        s_nftObjects[msg.sender][_tokenId] = Object(
            _nftAddress,
            _tokenId,
            true,
            _scale,
            _speed,
            _x,
            _y,
            _z
        );
        emit ItemAdded(
            msg.sender,
            _nftAddress,
            _tokenId,
            true,
            _scale,
            _speed,
            _x,
            _y,
            _z
        );
    }

    function updateNFT(
        address _nftAddress,
        uint256 _tokenId,
        uint16 _scale,
        uint16 _speed,
        int16 _x,
        int16 _y,
        int16 _z
    ) external {
        s_nftObjects[msg.sender][_tokenId] = Object(
            _nftAddress,
            _tokenId,
            true,
            _scale,
            _speed,
            _x,
            _y,
            _z
        );
        emit ItemAdded(
            msg.sender,
            _nftAddress,
            _tokenId,
            true,
            _scale,
            _speed,
            _x,
            _y,
            _z
        );
    }

    function removeNFT(address _nftAddress, uint256 _tokenId) external {
        s_nftObjects[msg.sender][_tokenId].enable = false;
        emit ItemAdded(
            msg.sender,
            _nftAddress,
            _tokenId,
            false,
            s_nftObjects[msg.sender][_tokenId].scale,
            s_nftObjects[msg.sender][_tokenId].speed,
            s_nftObjects[msg.sender][_tokenId].x,
            s_nftObjects[msg.sender][_tokenId].y,
            s_nftObjects[msg.sender][_tokenId].z
        );
    }
}
