module move_gas_optimization::parallel_vs_struct_vectors{
    
    ///Comparing the gas usage of parallel vectors vs using a single vectors of struct    
    /// packageID:
    /// cost:

    /// function creating and filling three parallel vectors with 10000 elements of type u256
    entry fun parallel_vector_func(){
        let mut vec1: vector<u256> = vector[];
        let mut vec2: vector<u256> = vector[];
        let mut vec3: vector<u256> = vector[];
        let mut i: u16 = 0;


        while(i < 10000){
            vec1.push_back(i);
            vec2.push_back(i);
            vec3.push_back(i);
        
            i = i + 1;
        }
        
    }

    
    /// struct with three fields to compare to three parallel vectors
    entry struct Test_struct{
        field1: u256,
        field2: u256,
        field3: u256
    }

    /// function creating and filling an vectors of struct with three fields, all fields of type u256
    entry fun struct_vector_func(){
        let mut struct_vector: vector<Test_struct> = vector[];
        let mut i: u16 = 0;

        while (i < 10000){
            struct_vector.push_back(Test_struct{
            field1:i,
            field2:i,
            field3:i
            });
            i = i + 1;
        };
        struct_vector.destroy_empty();
    }
}
