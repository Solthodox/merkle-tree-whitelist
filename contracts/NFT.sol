// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract NFT is ERC721, Ownable {
    bytes32 public MERKLE_HASH_ROOT;
    address[] public listedUsers;
    uint256 public mintCount;
    uint256 public totalSupply;

    // This would be very expensive since we have to loop trouugh all the users array and the array could be very long

    // modifier userWhitelisted() {
    //     bool found;
    //     for(uint i=0 ; i<listedUsers.length , i++){
    //         if(msg.sender==listedUsers[i]) found=true;
    //     }
    //     require(found , "User not whitelisted");
    //     _;
    // }

    // As an alternative we can verify if an element is in an array by using the merkle proof:

    modifier userWhitelisted(bytes32[] calldata proof) {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        bool found = MerkleProof.verify(proof, MERKLE_HASH_ROOT, leaf);
        require(found, "User not whitelisted");
        _;
    }

    constructor() ERC721("MiNewNFT", "MNFT") {
        // add users to whitelist => very expensive approach
        // listedUsers.push(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        // listedUsers.push(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
        // listedUsers.push(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC);
        // listedUsers.push(0x90F79bf6EB2c4f870365E785982E1f101E93b906);
        // listedUsers.push(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65);
        // listedUsers.push(0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc);
        // listedUsers.push(0x976EA74026E726554dB657fA54763abd0C3a0aa9);
        // listedUsers.push(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955);
        // listedUsers.push(0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f);
        // listedUsers.push(0xa0Ee7A142d267C1f36714E4a8F75612F20a79720);
        // listedUsers.push(0xBcd4042DE499D14e55001CcbB24a551F3b954096);
        // listedUsers.push(0x71bE63f3384f5fb98995898A86B02Fb2426c5788);
        // listedUsers.push(0xFABB0ac9d68B0B445fB7357272Ff202C5651694a);
        // listedUsers.push(0x1CBd3b2770909D4e10f157cABC84C7264073C9Ec);
        // listedUsers.push(0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097);
        // listedUsers.push(0xcd3B766CCDd6AE721141F452C550Ca635964ce71);
        // listedUsers.push(0x2546BcD3c84621e976D8185a91A922aE77ECEc30);
        // listedUsers.push(0xbDA5747bFD65F08deb54cb465eB87D40e51B197E);
        // listedUsers.push(0xdD2FD4581271e230360230F9337D5c0430Bf44C0);
        // listedUsers.push(0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199);
    }

    function setHashRoot(bytes32 hashRoot) public onlyOwner {
        MERKLE_HASH_ROOT = hashRoot;
    }

    function listSize() public view returns (uint256 length) {
        length = listedUsers.length;
    }

    function mint(bytes32[] calldata proof) public userWhitelisted(proof) {
        mintCount++;
        require(mintCount <= totalSupply, "Minting has ended");
        _mint(msg.sender, mintCount);
    }
}
