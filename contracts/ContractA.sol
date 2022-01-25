// SPDX-License-Identifier: unlicensed
pragma solidity 0.8.0;

//interface to interact with ERC721
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

//to be able to receive ERC721
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";

contract ContractB is ERC721Holder {
    function deposit(uint256 tokenId) external {}

    function withdraw(uint256 tokenId) external {}
}

contract ContractA is ERC721Holder {
    IERC721 public token;
    ContractB public contractB;

    constructor(address _token, address _contractB) {
        token = IERC721(_token);
        contractB = ContractB(_contractB);
    }

    function deposit(uint256 tokenId) external {
        token.safeTransferFrom(msg.sender, address(this), tokenId);
        token.approve(address(contractB), tokenId);
        contractB.deposit(tokenId);
    }

    function withdraw(uint256 tokenId) external {
        contractB.withdraw(tokenId);
        token.safeTransferFrom(address(this), msg.sender, tokenId);
    }
}
