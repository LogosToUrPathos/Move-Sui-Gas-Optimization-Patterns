module move_gas_optimization::integer_sizes{
    
    /// Examining the gas cost differences between integer definitions in sizes ranging from
    /// u8, u16, u32, u64, u128, u256
    
    /// packageID: 
    /// cost: 

    // repeated definition of u8 integer
    entry fun int_u8(){
        let mut i: u16 = 0;
        while(i < 1000){
            let x: u8;

            i = i + 1;
        }
    }
    
    // repeated definition of u16 integer
    entry fun int_u16(){
        let mut i : u16 = 0;
        while(i < 1000){
            let x: u16;
            i = i + 1;
        }
    }
    
    // repeated definition of u32 integer
    entry fun int_u32(){
        let mut i : u16 = 0;
        while(i < 1000){
            let x: u32;
            i = i + 1;
        }
    }
    
    // repeated definition of u64 integer
    entry fun int_u64(){
        let mut i : u16 = 0;
        while(i < 1000){
            let x: u64;
            i = i + 1;
        }
    }
    
    // repeated definition of u128 integer
    entry fun int_u128(){
        let mut i : u16 = 0;
        while(i < 1000){
            let x: u128;
            i = i + 1;
        }
    }
    
    // repeated definition of u256 integer
    entry fun int_u256(){
        let mut i : u16 = 0;
        while(i < 1000){
            let x: u256;
            i = i + 1;
        }
    }
    
}
