module move_gas_optimization::direct_vs_alias_addresses{

    
    public fun directAddress(){
        let mut i: u16 = 0;

        while(i < 1000){
            let x: address = @0x0;
            i = i + 1;
        }
    }
    
    
    public fun aliasAddress(){
        let mut i: u16 = 0;

        while(i < 1000){
            let x: address = @move_gas_optimization;
            i = i + 1;
        }
    }
    
}