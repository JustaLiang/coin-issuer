module justa_coin::justa_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct JUSTA_COIN has drop {}

    fun init(witness: JUSTA_COIN, ctx: &mut TxContext) {
        // Get a treasury cap for the coin and give it to the transaction sender
        let (treasury_cap, metadata) = coin::create_currency<JUSTA_COIN>(
            witness,
            6,
            b"JustaCoin",
            b"JTC",
            b"Coin issued by Justa Liang",
            option::none(),
            ctx
        );
        let justa = tx_context::sender(ctx);
        transfer::freeze_object(metadata);
        coin::mint_and_transfer(&mut treasury_cap, 1_000_000_000000, justa, ctx);
        transfer::transfer(treasury_cap, justa);
    }

    /// Manager can mint new coins
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JUSTA_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public entry fun burn(
        treasury_cap: &mut TreasuryCap<JUSTA_COIN>,
        coin: Coin<JUSTA_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}