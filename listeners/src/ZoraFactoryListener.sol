// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-generated/src/ZoraFactory.sol";

/// Index events from the ZoraFactory on Ethereum
/// This listener tracks coin creation events from the ZoraFactory
contract ZoraFactoryListener is 
    ZoraFactory$OnCoinCreatedEvent,
    ZoraFactory$OnCoinCreatedV4Event,
    ZoraFactory$OnCreatorCoinCreatedEvent
{
    /// Struct for V4 coin creation event data
    struct CoinCreatedV4Data {
        address caller;
        address payoutRecipient;
        address platformReferrer;
        address currency;
        string uri;
        string name;
        string symbol;
        address coin;
        bytes32 poolKeyHash;
        string version;
        bytes32 txnHash;
    }
    
    /// Struct for creator coin creation event data
    struct CreatorCoinCreatedData {
        address caller;
        address payoutRecipient;
        address platformReferrer;
        address currency;
        string uri;
        string name;
        string symbol;
        address coin;
        bytes32 poolKeyHash;
        string version;
        bytes32 txnHash;
    }

    /// Emitted events are indexed.
    /// To change the data which is indexed, modify the event or add more events.
    
    // Event for tracking coin creation events
    event CoinCreated(
        address caller,
        address payoutRecipient,
        address platformReferrer,
        address currency,
        string uri,
        string name,
        string symbol,
        address coin,
        address pool,
        string version,
        bytes32 txnHash
    );
    
    // Event for tracking coin creation V4 events
    // use an unamed event to avoid stack too deep errors: https://docs.sim.dune.com/idx/listener/errors#stack-too-deep-errors
    event CoinCreatedV4(CoinCreatedV4Data);
    
    // Event for tracking creator coin creation events
    event CreatorCoinCreated(CreatorCoinCreatedData);

    /// Handler for CoinCreated event
    function onCoinCreatedEvent(
        EventContext memory ctx,
        ZoraFactory$CoinCreatedEventParams memory inputs
    ) external override {
        emit CoinCreated(
            inputs.caller,
            inputs.payoutRecipient,
            inputs.platformReferrer,
            inputs.currency,
            inputs.uri,
            inputs.name,
            inputs.symbol,
            inputs.coin,
            inputs.pool,
            inputs.version,
            ctx.txn.hash()
        );
    }

    /// Handler for CoinCreatedV4 event
    function onCoinCreatedV4Event(
        EventContext memory ctx,
        ZoraFactory$CoinCreatedV4EventParams memory inputs
    ) external override {
        CoinCreatedV4Data memory data = CoinCreatedV4Data({
            caller: inputs.caller,
            payoutRecipient: inputs.payoutRecipient,
            platformReferrer: inputs.platformReferrer,
            currency: inputs.currency,
            uri: inputs.uri,
            name: inputs.name,
            symbol: inputs.symbol,
            coin: inputs.coin,
            poolKeyHash: inputs.poolKeyHash,
            version: inputs.version,
            txnHash: ctx.txn.hash()
        });
        
        emit CoinCreatedV4(data);
    }

    /// Handler for CreatorCoinCreated event
    function onCreatorCoinCreatedEvent(
        EventContext memory ctx,
        ZoraFactory$CreatorCoinCreatedEventParams memory inputs
    ) external override {
        CreatorCoinCreatedData memory data = CreatorCoinCreatedData({
            caller: inputs.caller,
            payoutRecipient: inputs.payoutRecipient,
            platformReferrer: inputs.platformReferrer,
            currency: inputs.currency,
            uri: inputs.uri,
            name: inputs.name,
            symbol: inputs.symbol,
            coin: inputs.coin,
            poolKeyHash: inputs.poolKeyHash,
            version: inputs.version,
            txnHash: ctx.txn.hash()
        });
        
        emit CreatorCoinCreated(data);
    }
}
