// SPDX-License-Identifier: unlicensed
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//basic
contract ERC721OpenZeppelinin1 is ERC721 {
    constructor() ERC721("Token Name", "Token Symbol") {}
}

//mint
contract ERC721OpenZeppelinin2 is ERC721 {
    constructor() ERC721("Token Name", "Token Symbol") {
        _safeMint(msg.sender, 0);
    }
}

//custom mint function for admin
contract ERC721OpenZeppelinin3 is ERC721 {
    address public admin;

    constructor() ERC721("Token Name", "Token Symbol") {
        admin = msg.sender;
    }

    function mint(address to, uint256 tokenId) external {
        require(msg.sender == admin, "only admin");
        _safeMint(to, tokenId);
    }
}

//custom mint function faucet
contract ERC721OpenZeppelinin4 is ERC721 {
    constructor() ERC721("Token Name", "Token Symbol") {}

    function faucet(address to, uint256 tokenId) external {
        _safeMint(to, tokenId);
    }
}

//token transfer

