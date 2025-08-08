module MyModule::VirtualLandNFT {

    use aptos_framework::signer;
    use aptos_framework::account;
    use aptos_framework::token_v1; // new NFT API
    use std::vector;               // for vector::empty

    /// Struct to store collection creation info
    struct LandCollection has key {
        name: vector<u8>,
    }

    /// Create a collection for virtual land NFTs (only once per creator)
    public fun create_collection(
        creator: &signer,
        name: vector<u8>,
        desc: vector<u8>,
        uri: vector<u8>
    ) {
        token_v1::create_collection(
            creator,
            name.clone(),
            desc,
            uri,
            0, // max supply: unlimited
            vector::empty<u8>(), // optional metadata
            vector::empty<u8>()  // additional field (if needed in v1)
        );
        move_to(creator, LandCollection { name });
    }

    /// Mint a land NFT for a given plot name
    public fun mint_land(
        creator: &signer,
        plot_name: vector<u8>,
        uri: vector<u8>
    ) acquires LandCollection {
        let col = borrow_global<LandCollection>(signer::address_of(creator));
        token_v1::create_token(
            creator,
            col.name.clone(),
            plot_name,
            b"Virtual Land Plot",
            1,              // supply
            uri,
            creator,
            0,              // royalty
            vector::empty
        );
    }
}