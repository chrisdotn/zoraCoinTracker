// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-generated/src/ZoraFactory.sol";

/// Index events from the ZoraFactory on Ethereum
/// This listener tracks coin creation events from the ZoraFactory
contract ZoraFactoryListener is 
    ZoraFactory$OnCoinCreatedEvent
    // ZoraFactory$OnCoinCreatedV4Event,
    // ZoraFactory$OnCreatorCoinCreatedEvent
{
    /// Emitted events are indexed.
    /// To change the data which is indexed, modify the event or add more events.
    
    // Event for tracking coin creation events
    event CoinCreated(
        uint64 chainId,
        address caller,
        address payoutRecipient,
        address platformReferrer,
        address currency,
        string uri,
        string name,
        string symbol,
        address coin,
        address pool,
        string version
    );
    
    // Event for tracking coin creation V4 events
    event CoinCreatedV4(
        uint64 chainId,
        address caller,
        address payoutRecipient,
        address platformReferrer,
        address currency,
        string uri,
        string name,
        string symbol,
        address coin,
        address currency0,
        address currency1,
        uint24 fee,
        int24 tickSpacing,
        address hooks,
        bytes32 poolKeyHash,
        string version
    );
    
    // Event for tracking creator coin creation events
    event CreatorCoinCreated(
        uint64 chainId,
        address caller,
        address payoutRecipient,
        address platformReferrer,
        address currency,
        string uri,
        string name,
        string symbol,
        address coin,
        address currency0,
        address currency1,
        uint24 fee,
        int24 tickSpacing,
        address hooks,
        bytes32 poolKeyHash,
        string version
    );

    /// Handler for CoinCreated event
    function onCoinCreatedEvent(
        EventContext memory ctx,
        ZoraFactory$CoinCreatedEventParams memory inputs
    ) external override {
        emit CoinCreated(
            uint64(block.chainid),
            inputs.caller,
            inputs.payoutRecipient,
            inputs.platformReferrer,
            inputs.currency,
            inputs.uri,
            inputs.name,
            inputs.symbol,
            inputs.coin,
            inputs.pool,
            inputs.version
        );
    }

    // /// Handler for CoinCreatedV4 event
    // function onCoinCreatedV4Event(
    //     EventContext memory ctx,
    //     ZoraFactory$CoinCreatedV4EventParams memory inputs
    // ) external override {
    //     emit CoinCreatedV4(
    //         uint64(block.chainid),
    //         inputs.caller,
    //         inputs.payoutRecipient,
    //         inputs.platformReferrer,
    //         inputs.currency,
    //         inputs.uri,
    //         inputs.name,
    //         inputs.symbol,
    //         inputs.coin,
    //         inputs.poolKey.currency0,
    //         inputs.poolKey.currency1,
    //         inputs.poolKey.fee,
    //         inputs.poolKey.tickSpacing,
    //         inputs.poolKey.hooks,
    //         inputs.poolKeyHash,
    //         inputs.version
    //     );
    // }

    // /// Handler for CreatorCoinCreated event
    // function onCreatorCoinCreatedEvent(
    //     EventContext memory ctx,
    //     ZoraFactory$CreatorCoinCreatedEventParams memory inputs
    // ) external override {
    //     emit CreatorCoinCreated(
    //         uint64(block.chainid),
    //         inputs.caller,
    //         inputs.payoutRecipient,
    //         inputs.platformReferrer,
    //         inputs.currency,
    //         inputs.uri,
    //         inputs.name,
    //         inputs.symbol,
    //         inputs.coin,
    //         inputs.poolKey.currency0,
    //         inputs.poolKey.currency1,
    //         inputs.poolKey.fee,
    //         inputs.poolKey.tickSpacing,
    //         inputs.poolKey.hooks,
    //         inputs.poolKeyHash,
    //         inputs.version
    //     );
    // }
}
