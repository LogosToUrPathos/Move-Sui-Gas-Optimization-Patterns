module move_gas_optimization::parallel_vs_struct_array{

    
    ///Comparing the gas usage of parallel arrays vs using a single array of struct    
    

    /// function creating and filling three parallel arrays with 1000 elements of type u16
    public fun parallel_array_func(){
        let mut array1: vector<u16> = vector[];
        let mut array2: vector<u16> = vector[];
        let mut array3: vector<u16> = vector[];
        let mut i: u16 = 0;


        while(i < 1000){
            array1.push_back(i);
            array2.push_back(i);
            array3.push_back(i);
        
            i = i + 1;
        }
        
    }

    
    /// struct with three fields to compare to three parallel arrays
    public struct Test_struct{
        field1: u16,
        field2: u16,
        field3: u16
    }

    /// function creating and filling an array of struct with three fields, all fields of type u16
    public fun struct_array_func(){
        let mut struct_array: vector<Test_struct> = vector[];
        let mut i: u16 = 0;

        while (i < 1000){
            struct_array.push_back(Test_struct{
            field1:i,
            field2:i,
            field3:i
            });
            i = i + 1;
        };
        struct_array.destroy_empty();
    }
}
