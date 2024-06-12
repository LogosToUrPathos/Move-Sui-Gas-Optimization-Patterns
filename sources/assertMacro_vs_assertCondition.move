module move_gas_optimization::assertMacro_vs_assertCondition{
    
    /// Examining the difference in gas using the shortened assert expression offered by Move Sui
    /// vs a conditional statement achieving the same result
    
    /// cost:
    /// packageID: https://testnet.suivision.xyz/package/0x416f802ec4ac3836d5f821a56f76cf108f3496243a8e80b7329f03855f6db0a6?tab=Code

    /// testing assertion in the form of assert macro
    entry fun assertMacro(){
        let x: bool = true;
        let mut i: u64 = 0;

        while(i < 100000){
            assert!(x, 0);  // asserting x is true, otherwise abort
            i = i + 1;
        }
    }
    
    
    /// testing assertion in the form of an 'if' clause rather than assert macro
    entry fun assertCondition(){
        let x: bool = true;
        let mut i: u64 = 0;

        while(i < 100000){
            if(!x){
                abort 0;  // asserting x is true, otherwise abort
            }
        }
    }
    
}
