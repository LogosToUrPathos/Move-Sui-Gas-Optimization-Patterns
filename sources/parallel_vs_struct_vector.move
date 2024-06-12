module move_gas_optimization::parallel_vs_struct_vectors{
    
    ///Comparing the gas usage of parallel vectors vs using a single vectors of struct    
    /// packageID: https://testnet.suivision.xyz/package/0x416f802ec4ac3836d5f821a56f76cf108f3496243a8e80b7329f03855f6db0a6?tab=Code
    /// cost:

    /// function creating and filling three parallel vectors with 10000 elements of type u256
    entry fun parallel_vector_func(){
        let mut vec1: vector<u256> = vector[];
        let mut vec2: vector<u256> = vector[];
        let mut vec3: vector<u256> = vector[];
        let mut i: u64 = 0;


        while(i < 100000){
            vec1.push_back(1);
            vec2.push_back(1);
            vec3.push_back(1);
        
            i = i + 1;
        }
        
    }

    
    /// struct with three fields to compare to three parallel vectors
    public struct Test_struct has drop{
        field1: u256,
        field2: u256,
        field3: u256
    }

    /// function creating and filling an vectors of struct with three fields, all fields of type u256
    entry fun struct_vector_func(){
        let mut struct_vector: vector<Test_struct> = vector[];
        let mut i: u64 = 0;

        while (i < 100000){
            let mut test_object = Test_struct{field1: 1, field2: 1, field3: 1};
            struct_vector.push_back(test_object);
            i = i + 1;
        }
        //struct_vector.destroy_empty();
    }

    public struct Test has drop{
        field1: u256
    }
    entry fun test_vector_struct(){
        let mut test_vector: vector<Test> = vector[];

        let mut test1 = Test{field1: 0};
        test_vector.push_back(test1);
    }
}
