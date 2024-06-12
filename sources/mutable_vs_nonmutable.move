module move_gas_optimization::mutable_vs_nonmutable{
    
    /// Examining gas cost difference between mutable and nonmutable variable definitions
    /// packageID:
    /// cost: 

    /// repeat definitions of a mutable u16 integer
    entry fun mutable_integer(){
        let mut i: u16 = 0;

        while(i < 1000){
            let mut x: u16;
            i = i + 1;
        }
    }

    /// repeat definitions of a nonmutable u16 
    entry fun nonmutable_integer(){
        let mut i: u16 = 0;

        while(i < 1000){
            let x: u16;
            i = i + 1;
        }
    }
    
    /// repeat definitions of mutable boolean
    entry fun mutable_boolean(){
        let mut i: u16 = 0;

        while(i < 1000){
            let mut x: bool = true;
            i = i + 1;
        }
    }
    
    /// repeat definitions of nonmutable boolean
    entry fun nonmutable_boolean(){
        let mut i: u16 = 0;
        while(i < 1000){
            let mut x: bool = true;
            i = i + 1;
        }
    }
    
}
