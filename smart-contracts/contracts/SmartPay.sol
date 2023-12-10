// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./SmartPayAccount.sol";
contract SmartPay {
    // Structs
    
    mapping(address => address) public smartAccounts;
    mapping(string => address) public emailAccounts;
    mapping(address => bool ) public accountExistance;
    SmartPayAccount public _smartPayAccount;     
    // Events
    event SmartPayWalletCreated(address creator, address smartAccountAddress, string linkedEmailAddress );

    // Storage

    /**
     * @dev Create a new SmartPayWallet
     * @param _email email to be associated with the account 
     */
    function createSmartPayWallet(string memory _email) external{
        _smartPayAccount= new SmartPayAccount(msg.sender,_email,address(this));
        address newAddress =address(_smartPayAccount);
        accountExistance[newAddress]=true;
        smartAccounts[msg.sender] =newAddress;
        emailAccounts[_email] =newAddress;

        emit SmartPayWalletCreated(msg.sender, newAddress, _email);
        
    }



    
}
