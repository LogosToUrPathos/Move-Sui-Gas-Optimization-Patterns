module test_deployment::integer_operations{
    
    /// Examining the gas cost differences between integer definitions in sizes ranging from
    /// u8, u16, u32, u64, u128, u256
    
    /// packageID: https://testnet.suivision.xyz/package/0x416f802ec4ac3836d5f821a56f76cf108f3496243a8e80b7329f03855f6db0a6?tab=Code
    /// cost: 
    //use std::vector;

    // repeated definition of u8 integer
    public entry fun int_u8(){
        let i: u64 = 0;
        while(i < 10000){
            let x: u8;

            i = i + 1;
        }
    }

    public entry fun int_u8_add(){
        let i = 0;
        let x: u8 = 4;
        //let y: u8 = 4;
        while(i < 10000){
            x = 4 + 4;
            i = i + 1;
        }
    }
    public entry fun int_u8_sub(){
        let i = 0;
        let x: u8;
        //let y: u8 = 4;
        while(i < 10000){
            x = 5 - 4;
            i = i + 1;
        }
    }
    public entry fun int_u8_mult(){
        let i = 0;
        let x: u8;
        //let y: u8 = 4;
        while(i < 10000){
            x = 4 * 4;
            i = i + 1;
        }
    }
    public entry fun int_u8_div(){
        let i = 0;
        let x: u8;
        //let y: u8 = 4;
        while(i < 10000){
            x = 4 / 4;
            i = i + 1;
        }
    }

// ====================================================================
    // do operations next
    // repeated definition of u16 integer
    public entry fun int_u16(){
        let i : u64 = 0;
        while(i < 10000){
            let x: u16;
            i = i + 1;
        }
    }
    
    public entry fun int_u16_add(){
        let i = 0;
        let x: u16;
        //let y: u16 = 4;
        while(i < 10000){
            x = 4 + 4;
            i = i + 1;
        }
    }
    public entry fun int_u16_sub(){
        let i = 0;
        let x: u16;
        //let y: u16 = 4;
        while(i < 10000){
            x = 5 - 4;
            i = i + 1;
        }
    }
    public entry fun int_u16_mult(){
        let i = 0;
        let x: u16;
        //let y: u16 = 4;
        while(i < 10000){
            x = 4 * 4;
            i = i + 1;
        }
    }
    public entry fun int_u16_div(){
        let i = 0;
        let x: u16;
        //let y: u16 = 4;
        while(i < 10000){
            x = 4 / 4;
            i = i + 1;
        }
    }
// =============================================================
    // repeated definition of u32 integer
    public entry fun int_u32(){
        let i : u64 = 0;
        while(i < 10000){
            let x: u32;
            i = i + 1;
        }
    }
    
    public entry fun int_u32_add(){
        let i = 0;
        let x: u32;
        //let y: u32 = 4;
        while(i < 10000){
            x = 4 + 4;
            i = i + 1;
        }
    }
    public entry fun int_u32_sub(){
        let i = 0;
        let x: u32;
        //let y: u32 = 4;
        while(i < 10000){
            x = 5 - 4;
            i = i + 1;
        }
    }
    public entry fun int_u32_mult(){
        let i = 0;
        let x: u32;
        //let y: u32 = 4;
        while(i < 10000){
            x = 4 * 4;
            i = i + 1;
        }
    }
    public entry fun int_u32_div(){
        let i = 0;
        let x: u32;
        //let y: u32 = 4;
        while(i < 10000){
            x = 4 / 4;
            i = i + 1;
        }
    }
    
// =========================================================================
    // repeated definition of u64 integer
    public entry fun int_u64(){
        let i : u64 = 0;
        while(i < 10000){
            let x: u64;
            i = i + 1;
        }
    }
    
    public entry fun int_u64_add(){
        let i = 0;
        let x: u64;
        //let y: u64 = 4;
        while(i < 10000){
            x = 4 + 4;
            i = i + 1;
        }
    }
    public entry fun int_u64_sub(){
        let i = 0;
        let x: u64;
        //let y: u64 = 4;
        while(i < 10000){
            x = 5 - 4;
            i = i + 1;
        }
    }
    public entry fun int_u64_mult(){
        let i = 0;
        let x: u64;
        //let y: u64 = 4;
        while(i < 10000){
            x = 4 * 4;
            i = i + 1;
        }
    }
    public entry fun int_u64_div(){
        let i = 0;
        let x: u64;
        //let y: u64 = 4;
        while(i < 10000){
            x = 4 / 4;
            i = i + 1;
        }
    }
   
// =====================================================================
    // repeated definition of u128 integer
    public entry fun int_u128(){
        let i : u64 = 0;
        while(i < 10000){
            let x: u128;
            i = i + 1;
        }
    }
    
    public entry fun int_u128_add(){
        let i = 0;
        let x: u128;
        //let y: u128 = 4;
        while(i < 10000){
            x = 4 + 4;
            i = i + 1;
        }
    }
    public entry fun int_u128_sub(){
        let i = 0;
        let x: u128;
        //let y: u128 = 4;
        while(i < 10000){
            x = 5 - 4;
            i = i + 1;
        }
    }
    public entry fun int_u128_mult(){
        let i = 0;
        let x: u128;
        //let y: u128 = 4;
        while(i < 10000){
            x = 4 * 4;
            i = i + 1;
        }
    }
    public entry fun int_u128_div(){
        let i = 0;
        let x: u128;
        //let y: u128 = 4;
        while(i < 10000){
            x = 4 / 4;
            i = i + 1;
        }
    }

// =====================================================================
    // repeated definition of u256 integer
    public entry fun int_u256(){
        let i : u64 = 0;
        while(i < 10000){
            let x: u256;
            i = i + 1;
        }
    }

    public entry fun int_u256_add(){
        let i = 0;
        let x: u256;
        //let y: u256 = 4;
        while(i < 10000){
            x = 4 + 4;
            i = i + 1;
        }
    }
    public entry fun int_u256_sub(){
        let i = 0;
        let x: u256 = 4;
        //let y: u256 = 4;
        while(i < 10000){
            x = 5 - 4;
            i = i + 1;
        }
    }
    public entry fun int_u256_mult(){
        let i = 0;
        let x: u256;
        //let y: u256 = 4;
        while(i < 10000){
            x = 4 * 4;
            i = i + 1;
        }
    }
    public entry fun int_u256_div(){
        let i = 0;
        let x: u256;
        //let y: u256 = 4;
        while(i < 10000){
            x = 4 / 4;
            i = i + 1;
        }
    }
    
}
