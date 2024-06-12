module move_gas_optimization::redefined_variables{
    
    /// Comparing gas costs of redefined variables vs variables defined outside a loop
    /// Variable redefinition and reassignment within a loop vs single definition outside loop
    /// - and reassignment within loop
    
    /// packageID: https://testnet.suivision.xyz/package/0x416f802ec4ac3836d5f821a56f76cf108f3496243a8e80b7329f03855f6db0a6?tab=Code
    /// cost: 

    /// examines an integer variable defined outside a loop and reassigned a value within the loop
    entry fun non_redefined_integer(){
        let mut i: u64 = 0;
        let mut x: u16;

        while(i < 100000){
            x = 1;
            i = i + 1;
        }    
    }
 
    /// examines an integer variable defined repeatedly within a loop and reassigned within the loop as well
    entry fun redefined_integer(){
        let mut i: u64 = 0;
        
        while(i < 100000){
            let x: u16 = 1;
            i = i + 1;
        }
    }
   
    /// examines a character variable defined outside a loop and reassigned a value within the loop
    entry fun non_redefined_booleans(){
        let mut i: u64 = 0;
        let mut x: bool;
        
        while(i < 100000){
            x = true;
            i = i + 1;
        }
    }
    
    /// examines a character variable defined repeatedly within a loop and reassigned within the loop as well
    entry fun redefined_booleans(){
        let mut i: u64 = 0;

        while(i < 100000){
            let x: bool = true;
            i = i + 1;
        }
    }
    
}
