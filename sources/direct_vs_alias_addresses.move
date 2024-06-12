module move_gas_optimization::direct_vs_alias_addresses{

    /// Examining the difference in costs using direct address references vs
    /// alias address references
    /// cost: 
    /// packageID: https://testnet.suivision.xyz/package/0x416f802ec4ac3836d5f821a56f76cf108f3496243a8e80b7329f03855f6db0a6?tab=Code
    
    /// Using a direct reference to the address
    entry fun directAddress(){
        let mut i: u64 = 0;

        while(i < 100000){
            let x: address = @0x0;
            i = i + 1;
        }
    }
    
    /// Using an alias to reference an address
    entry fun aliasAddress(){
        let mut i: u64 = 0;

        while(i < 100000){
            let x: address = @move_gas_optimization;
            i = i + 1;
        }
    }
    
}
