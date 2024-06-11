module move_gas_optimization::mutable_vs_nonmutable{
    /*
    public fun mutable_integer(){
        let mut i: u16 = 0;

        while(i < 1000){
            let mut x: u16;
            i = i + 1;
        }
    }
    */
    /*
    public fun nonmutable_integer(){
        let mut i: u16 = 0;

        while(i < 1000){
            let x: u16;
            i = i + 1;
        }
    }
    

    public fun mutable_boolean(){
        let mut i: u16 = 0;

        while(i < 1000){
            let mut x: bool = true;
            i = i + 1;
        }
    }
    */
    public fun nonmutable_boolean(){
        let mut i: u16 = 0;
        while(i < 1000){
            let mut x: bool = true;
            i = i + 1;
        }
    }
    
}
