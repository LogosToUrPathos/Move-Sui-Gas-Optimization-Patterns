module parallel_vs_struct_vector_object::object_test{
    
    // struct for vector of struct
    public struct Struct_test has copy, drop, store{
        f1: u256,
        f2: u256,
        f3: u256
    }
    
    
    // object for vector of struct
    public struct Struct_object has key, store{
        id: UID,
        obj_vec: vector<Struct_test>

    }

    // object for parallel vectors
    public struct Parallel_object has key, store{
        id: UID,
        vec1: vector<u256>,
        vec2: vector<u256>,
        vec3: vector<u256>
    }

    // creating object for vector of struct
    public entry fun create_struct_object(ctx: &mut TxContext){
        let mut obj_vec_new: vector<Struct_test> = vector[];
        let mut i = 0;

        while(i < 1000){
            vector::push_back(&mut obj_vec_new, Struct_test{f1: 1u256, f2: 2u256, f3: 3u256});
            i = i + 1;
        };

        let new_object = Struct_object{id: object::new(ctx), obj_vec: obj_vec_new};
        transfer::transfer(new_object, tx_context::sender(ctx));
    }

    // creating object for parallel vectors
    public entry fun create_parallel_object(ctx: &mut TxContext){
        let mut vec1_new: vector<u256> = vector[];
        let mut vec2_new: vector<u256> = vector[];
        let mut vec3_new: vector<u256> = vector[];
        let mut i = 0;

        while(i < 1000){
            vector::push_back(&mut vec1_new, 1);
            vector::push_back(&mut vec2_new, 2);
            vector::push_back(&mut vec3_new, 3);

            i = i + 1;
        };

        let new_object = Parallel_object{id: object::new(ctx), vec1: vec1_new, vec2: vec2_new, vec3: vec3_new};
        transfer::transfer(new_object, tx_context::sender(ctx));
    }

    // linear search function using an object containing parallel vectors
    public entry fun search_parallel(object: &mut Parallel_object){
        let mut i = 0;
        let length = vector::length(&object.vec1);
        let element = 1000;
        let mut found_index = 0;

        while(i < length){
            if(vector::borrow(&object.vec1, i) == element){
                found_index = i;
            };
            i = i + 1;
        };
    }

    // linear search function using an object containing vector of struct
    public entry fun search_struct(object: &mut Struct_object){
        let mut i = 0;
        let length = vector::length(&object.obj_vec);
        let element = 1000;
        let mut found_index = 0;

        while(i < length){
            if(vector::borrow(&object.obj_vec, i).f1 == element){
                found_index = i;
            };
            i = i + 1;
        };
    }

    //=======================================================================================
    // ADDITION

    // function to add fields of 
    public entry fun add_struct(object1: &mut Struct_object, object2: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            //object1.obj_vec.f1[i] = object1.obj_vec.f2[i] + object2.obj_vec.f2[i];
            // object -> access obj_vec vector of struct -> access field1 vector at index [i];
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            let target_struct2 = vector::borrow_mut(&mut object2.obj_vec, i);

            target_struct1.f1 = target_struct1.f2 + target_struct2.f2;
            i = i + 1;
        };
    }

    public entry fun add_struct_singleObj(object1: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            target_struct1.f1 = target_struct1.f2 + 1;
            i = i + 1;
        };
    }
    
    public entry fun add_parallel(object1: &mut Parallel_object, object2: &mut Parallel_object){
        let mut i = 0;

        while(i < 1000){
            *vector::borrow_mut(&mut object1.vec1, i) = *vector::borrow(&mut object1.vec2, i) + *vector::borrow(&mut object2.vec2, i);
        };
    }
    
    // ===========================================================================================
    // SUBTRACTION

    public entry fun sub_struct(object1: &mut Struct_object, object2: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            //object1.obj_vec.f1[i] = object1.obj_vec.f2[i] + object2.obj_vec.f2[i];
            // object -> access obj_vec vector of struct -> access field1 vector at index [i];
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            let target_struct2 = vector::borrow_mut(&mut object2.obj_vec, i);

            target_struct1.f1 = target_struct1.f2 - target_struct2.f2;
            i = i + 1;
        };
    }

    public entry fun sub_struct_singleObj(object1: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            target_struct1.f1 = target_struct1.f2 - 1;
            i = i + 1;
        };
    }
    
    public entry fun sub_parallel(object1: &mut Parallel_object, object2: &mut Parallel_object){
        let mut i = 0;

        while(i < 1000){
            *vector::borrow_mut(&mut object1.vec1, i) = *vector::borrow(&mut object1.vec2, i) - *vector::borrow(&mut object2.vec2, i);
        };
    }

    // ======================================================================================
    // MULTIPLICATION

    public entry fun mult_struct(object1: &mut Struct_object, object2: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            //object1.obj_vec.f1[i] = object1.obj_vec.f2[i] + object2.obj_vec.f2[i];
            // object -> access obj_vec vector of struct -> access field1 vector at index [i];
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            let target_struct2 = vector::borrow_mut(&mut object2.obj_vec, i);

            target_struct1.f1 = target_struct1.f2 * target_struct2.f2;
            i = i + 1;
        };
    }

    public entry fun mult_struct_singleObj(object1: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            target_struct1.f1 = target_struct1.f2 * 1;
            i = i + 1;
        };
    }
    
    public entry fun mult_parallel(object1: &mut Parallel_object, object2: &mut Parallel_object){
        let mut i = 0;

        while(i < 1000){
            *vector::borrow_mut(&mut object1.vec1, i) = *vector::borrow(&mut object1.vec2, i) * *vector::borrow(&mut object2.vec2, i);
        };
    }

    // ====================================================================================
    // DIVISION

    public entry fun div_struct(object1: &mut Struct_object, object2: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            //object1.obj_vec.f1[i] = object1.obj_vec.f2[i] + object2.obj_vec.f2[i];
            // object -> access obj_vec vector of struct -> access field1 vector at index [i];
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            let target_struct2 = vector::borrow_mut(&mut object2.obj_vec, i);

            target_struct1.f1 = target_struct1.f2 / target_struct2.f2;
            i = i + 1;
        };
    }

    public entry fun div_struct_singleObj(object1: &mut Struct_object){
        let mut i = 0;
        
        while(i < 1000){
            let target_struct1 = vector::borrow_mut(&mut object1.obj_vec, i);
            target_struct1.f1 = target_struct1.f2 / 1;
            i = i + 1;
        };
    }
    
    public entry fun div_parallel(object1: &mut Parallel_object, object2: &mut Parallel_object){
        let mut i = 0;

        while(i < 1000){
            *vector::borrow_mut(&mut object1.vec1, i) = *vector::borrow(&mut object1.vec2, i) / *vector::borrow(&mut object2.vec2, i);
        };
    }
}
