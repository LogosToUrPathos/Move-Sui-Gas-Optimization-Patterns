module move_gas_optimization::assertMacro_vs_assertCondition{
    
    /// testing assertion in the form of assert macro
    public fun assertMacro(){
        let x: bool = true;
        let mut i: u16 = 0;

        while(i < 1000){
            assert(x, 0);  // asserting x is true, otherwise abort
            i = i + 1;
        }
    }
    
    
    /// testing assertion in the form of an 'if' clause rather than assert macro
    public fun assertCondition(){
        let x: bool = true;
        let mut i: u16 = 0;

        while(i < 1000){
            if(!x){
                abort 0;  // asserting x is true, otherwise abort
            }
        }
    }
    
}
