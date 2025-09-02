# Zora Coin Creation Tracker

This IDX app tracks Zora Coin Creation events on BASE. Specifically, it tracks the three events `CoinCreated`, `CoinCreatedV4`, and `CreatorCoinCreated`.

The factory contract is deployed at `0x777777751622c0d3258f214F9DF38E35BF45baF3` on the BASE blockchain. 

Test blocks for the three events are: 

- `CoinCreated`: 26875151
- `CoinCreatedV4`, `CreatorCoinCreated`: 32127961
- `CreatorCoinCreated`: 
## App Structure

```text
.
├── sim.toml                     # App configuration
├── apis/                        # Your custom API code
├── abis/                        # Contract ABI files (JSON)
│   └── UniswapV3Factory.json    # Example: Uniswap V3 Factory ABI
└── listeners/                   # Foundry project for listener contracts
    ├── src/
    │   └── Main.sol             # Triggers contract & listener logic
    └── test/
        └── Main.t.sol           # Unit tests for your listener
```

The `listeners/` directory is a Foundry project where your indexing logic lives. For a detailed breakdown of each file and folder, see the [App Folder Structure](https://docs.sim.dune.com/idx/app-structure) documentation.
