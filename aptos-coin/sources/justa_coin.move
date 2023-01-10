module justa::justa_coin {
    use aptos_framework::managed_coin;

    struct JustaCoin {}

    fun init_module(issuer: &signer) {
        managed_coin::initialize<JustaCoin>(
            issuer,
            b"JustaCoin",
            b"JTC",
            8,
            false,
        );
        managed_coin::register<JustaCoin>(issuer);
        managed_coin::mint<JustaCoin>(
            issuer,
            std::signer::address_of(issuer),
            1_000_000_00000000,
        );
    }
}