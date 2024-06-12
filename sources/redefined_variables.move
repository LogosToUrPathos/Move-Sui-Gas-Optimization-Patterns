module move_gas_optimization::redefined_variables{
    
    public fun non_redefined_integer(){
        let mut i: u16 = 0;
        let mut x: u16;

        while(i < 1000){
            x = i;
            i = i + 1;
        }    
    }
 
    public fun redefined_integer(){
        let mut i: u16 = 0;
        
        while(i < 1000){
            let x: u16 = i;
            i = i + 1;
        }
    }
   
    public fun non_redefined_booleans(){
        let mut i: u16 = 0;
        let mut x: bool;
        
        while(i < 1000){
            x = true;
            i = i + 1;
        }
    }
    
    public fun redefined_booleans(){
        let mut i: u16 = 0;

        while(i < 1000){
            let x: bool = true;
            i = i + 1;
        }
    }
    
}
