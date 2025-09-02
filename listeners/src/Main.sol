// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import "./ZoraFactoryListener.sol";

contract Triggers is BaseTriggers {
    // ZoraFactory contract address on BASE chain
    address constant ZORA_FACTORY_BASE = 0x777777751622c0d3258f214F9DF38E35BF45baF3;
    
    function triggers() external virtual override {
        ZoraFactoryListener listener = new ZoraFactoryListener();
        
        // Add trigger for CoinCreated event on BASE chain
        addTrigger(
            chainContract(Chains.Base, ZORA_FACTORY_BASE),
            listener.triggerOnCoinCreatedEvent()
        );

        addTrigger(
            chainContract(Chains.Base, ZORA_FACTORY_BASE),
            listener.triggerOnCoinCreatedV4Event()
        );

        addTrigger(
            chainContract(Chains.Base, ZORA_FACTORY_BASE),
            listener.triggerOnCreatorCoinCreatedEvent()
        );
    }
}
