module move_gas_optimization::mutable_vs_nonmutable{
    
    /// Examining gas cost difference between mutable and nonmutable variable definitions
    /// packageID: https://testnet.suivision.xyz/package/0x416f802ec4ac3836d5f821a56f76cf108f3496243a8e80b7329f03855f6db0a6?tab=Code
    /// cost: 

    /// repeat definitions of a mutable u16 integer
    entry fun mutable_integer(){
        let mut i: u64 = 0;

        while(i < 100000){
            let mut x: u16;
            i = i + 1;
        }
    }

    /// repeat definitions of a nonmutable u16 
    entry fun nonmutable_integer(){
        let mut i: u64 = 0;

        while(i < 100000){
            let x: u16;
            i = i + 1;
        }
    }
    
    /// repeat definitions of mutable boolean
    entry fun mutable_boolean(){
        let mut i: u64 = 0;

        while(i < 100000){
            let mut x: bool = true;
            i = i + 1;
        }
    }
    
    /// repeat definitions of nonmutable boolean
    entry fun nonmutable_boolean(){
        let mut i: u64 = 0;
        while(i < 100000){
            let mut x: bool = true;
            i = i + 1;
        }
    }
    
}
