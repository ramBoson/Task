// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.25;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
address public admin;
uint256 public pertoken;

constructor(string memory name, string memory symbol,uint256 totalsupply,uint256 per) ERC20(name, symbol) {
    admin = msg.sender;
    pertoken = per;
    _mint(msg.sender, totalsupply); // Mint 1,000 tokens to the contract deployer
}

modifier onlyAdmin() {
    require(msg.sender == admin, "Only admin can call this function");
    _;
}

function mint(address to, uint256 amount) external onlyAdmin {
    // Allowing the admin to mint new tokens
    _mint(to, amount);
}

function burn(uint256 amount) external {
    // Allowing anyone to burn their own tokens
    _burn(msg.sender, amount);
}
function transferNew(uint256 amount) public   {
    IERC20 erc20Token = IERC20(address(this));
    erc20Token.transfer(address(this),amount);
}
function withdrawToken(uint256 amount)public onlyAdmin{
    require(admin == msg.sender,"you are not owner address");
    IERC20 erc20Token = IERC20(address(this));
    erc20Token.transfer(admin,amount);
}
}