module move_gas_optimization::direct_vs_alias_addresses{

    /// Examining the difference in costs using direct address references vs
    /// alias address references
    /// cost: 
    /// packageID:
    
    /// Using a direct reference to the address
    entry fun directAddress(){
        let mut i: u16 = 0;

        while(i < 10000){
            let x: address = @0x0;
            i = i + 1;
        }
    }
    
    /// Using an alias to reference an address
    entry fun aliasAddress(){
        let mut i: u16 = 0;

        while(i < 10000){
            let x: address = @move_gas_optimization;
            i = i + 1;
        }
    }
    
}
