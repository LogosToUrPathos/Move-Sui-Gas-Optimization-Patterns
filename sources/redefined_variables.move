module move_gas_optimization::redefined_variables{
    
    /// Comparing gas costs of redefined variables vs variables defined outside a loop
    /// Variable redefinition and reassignment within a loop vs single definition outside loop
    /// - and reassignment within loop
    
    /// packageID:
    /// cost: 

    /// examines an integer variable defined outside a loop and reassigned a value within the loop
    entry fun non_redefined_integer(){
        let mut i: u16 = 0;
        let mut x: u16;

        while(i < 1000){
            x = i;
            i = i + 1;
        }    
    }
 
    /// examines an integer variable defined repeatedly within a loop and reassigned within the loop as well
    entry fun redefined_integer(){
        let mut i: u16 = 0;
        
        while(i < 1000){
            let x: u16 = i;
            i = i + 1;
        }
    }
   
    /// examines a character variable defined outside a loop and reassigned a value within the loop
    entry fun non_redefined_booleans(){
        let mut i: u16 = 0;
        let mut x: bool;
        
        while(i < 1000){
            x = true;
            i = i + 1;
        }
    }
    
    /// examines a character variable defined repeatedly within a loop and reassigned within the loop as well
    entry fun redefined_booleans(){
        let mut i: u16 = 0;

        while(i < 1000){
            let x: bool = true;
            i = i + 1;
        }
    }
    
}
