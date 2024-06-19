module test_deployment::parallel_vs_struct_vector{
    
    //Comparing the gas usage of parallel vectors vs using a single vectors of struct    
    // packageID: https://testnet.suivision.xyz/package/0x416f802ec4ac3836d5f821a56f76cf108f3496243a8e80b7329f03855f6db0a6?tab=Code
    // cost:
    
   use std::vector;
   //use std::string;
   //use std::u256;
    // function creating and filling three parallel vectors with 10,000 elements of type u256
    public entry fun parallel_vector_func(){

        // declaring three parallel vectors
        let vec1: vector<u256> = vector[];
        let vec2: vector<u256> = vector[];
        let vec3: vector<u256> = vector[];
        let i: u64 = 0;

        // iterating 10,000 times to create noticable gas cost difference
        while(i < 10000){
            // pushing elements to vector
            // integer type concluded to have no effect
            // integer's size has no noticable effect either
            vector::push_back(&mut vec1, 1);
            vector::push_back(&mut vec1, 1);
            vector::push_back(&mut vec1, 1);

            //vec1.push_back(1);
            //vec2.push_back(1);
            //vec3.push_back(1);
        
            i = i + 1;
        }
        
    }
    

    // struct used in experiments
    struct S1 has copy, drop{
        f1: u256,
        f2: u256,
        f3: u256
    }

    entry fun struct_vector_func(){
        let v: vector<S1> = vector[];
        let i = 0;

        while (i < 10000){
            let test_object = S1{f1: 1, f2: 1, f3: 1};
            vector::push_back(&mut v, test_object);
            //v.push_back(test_object);
            i = i + 1;
        }
        //struct_vector.destroy_empty();
    }

    
    // creates a vector of S1 struct type
    // Its purpose is to create a vector of 1,000 elements and searches through it
    public entry fun search_vector() {
        let v: vector<S1> = vector[];
        let i = 0;
        
        // populating vector with 1,000 structs of type S1
        while(i < 10000){
            // assigning all fields to be their index
            let s1 = S1{f1: i, f2: i, f3: i};

            vector::push_back(&mut v, s1);
            //v.push_back(s1);
            i = i + 1;
        };

        // preparation to find '10000' in vector
        // 1,000 is chosen to search through entire vector as elements have all
        // three fields assigned to their index
        let i = 0;
        let length = vector::length(&v);
        let element = 10000;
        let found_index = 0;

        //if(vector::borrow(&v, 1).f1 == element){};

        // searching through entire vector
        while(i < length){
            // comparison between current indexes's field1 and the desired element (10000)
            if(vector::borrow(&v, i).f1 == element){
                found_index = i;
            };
            i = i + 1;
        };

        /*
        // finding result of search
        if(found_index != 0){
            let msg = b"Element found".to_string();
        } else {
            let msg = b"Element not found".to_string();
        };
        */

        //v.destroy_empty();
    }

    
    public entry fun search_parallel(){
        // creating three parallel vectors
        let i = 0;
        let vec1: vector<u256> = vector[];
        let vec2: vector<u256> = vector[];
        let vec3: vector<u256> = vector[];

        while (i < 10000){

            // assigning the value of i, to elements of vectors at index i 
            //vec1.push_back(i);
            //vec2.push_back(i);
            //vec3.push_back(i);

            vector::push_back(&mut vec1, i);
            vector::push_back(&mut vec1, i);
            vector::push_back(&mut vec1, i);

            i = i + 1;
        };

        // preparations for search
        let i = 0;
        let length = vector::length(&vec1);  // all vectors are of the same size
        let element: u256 = 10000;
        let found_index = 0;

        while(i < length){
            // comparison between current indexes's field1 and the desired element (10000)
            let borrowed_element = vector::borrow(&vec1, i);
            if(*borrowed_element == element){
                found_index = i;
            };
            i = i + 1;
        };

        /*
        // finding result of search
        if(found_index != 0){
            let msg = b"Element found".to_string();
        } else {
            let msg = b"Element not found".to_string();
        };
        */

    }

    

    // Operations done with fields of a struct
    public entry fun add_vector_fields(){
        let i = 0;
        let v:vector<S1> = vector[];

        // declarations of two structs to be operated on and pushing them to the vector
        let s1 = S1{f1: 10, f2: 10, f3: 10};
        let s2 = S1{f1: 20, f2: 20, f3: 20};

        vector::push_back(&mut v, s1);  // aptos version
        vector::push_back(&mut v, s1);

        //v.push_back(s1);   // sui version
        //v.push_back(s2);


        // Iterating 10,000 times to create a noticable gas cost difference
        while (i < 10000){

            // Creating an updated instance of s1 with changes to field 1 (f1)
            // f1 becomes the sum of s1.f2 and s2.f2
            let updated_s1: S1 = S1{f1: s1.f2 + s2.f2, f2: s1.f2, f3: s1.f3};

            // Re-assigning s1 to become an updated version of itself
            s1 = updated_s1;


            i = i + 1;
        };

        //v.destroy_empty();
    }

    

    public entry fun add_parallel(){
        // creating three parallel vectors
        let i = 0;
        let vec1: vector<u256> = vector[];
        let vec2: vector<u256> = vector[];
        let vec3: vector<u256> = vector[];

        // creating two pairs of parallel vectors

        vector::push_back(&mut vec1, 10);   // aptos version of push_back
        vector::push_back(&mut vec2, 10);
        vector::push_back(&mut vec3, 10);

        vector::push_back(&mut vec1, 20);
        vector::push_back(&mut vec2, 20);
        vector::push_back(&mut vec3, 20);

        /*
        vec1.push_back(10);     // sui version of push_back()
        vec2.push_back(10);
        vec3.push_back(10);

        vec1.push_back(20);
        vec2.push_back(20);
        vec3.push_back(20);
        */

        while(i < 10000){

            // grab the sum of vec2[0] and vec2[1] and assign it to vec1[0]
            let sum = *vector::borrow(&vec2, 0) + *vector::borrow(&vec2, 1);
            let vec1_reference = vector::borrow_mut(&mut vec1, 0);
            *vec1_reference = sum;

            i = i + 1;
        };


    }

    
//----------------------------------------------------------------------------------------

    // multiplication operation done with fields of a struct
    public entry fun mult_vector_fields(){
        let i = 0;
        let v:vector<S1> = vector[];

        // declarations of two structs to be operated on and pushing them to the vector
        let s1 = S1{f1: 10, f2: 10, f3: 10};
        let s2 = S1{f1: 20, f2: 20, f3: 20};

        vector::push_back(&mut v, s1);  // aptos version of push_back()
        vector::push_back(&mut v, s2);

        //v.push_back(s1);  // sui version of push_back()
        //v.push_back(s2);


        // Iterating 10,000 times to create a noticable gas cost difference
        while (i < 10000){

            // Creating an updated instance of s1 with changes to field 1 (f1)
            // f1 becomes the product of s1.f2 and s2.f2
            let updated_s1: S1 = S1{f1: s1.f2 * s2.f2, f2: s1.f2, f3: s1.f3};

            s1.f1 = s1.f2 + s2.f2;
            // Re-assigning s1 to become an updated version of itself
            s1 = updated_s1;


            i = i + 1;
        };

        //v.destroy_empty();
    }

    

    public entry fun mult_parallel(){
        // creating three parallel vectors
        let i = 0;
        let vec1: vector<u256> = vector[];
        let vec2: vector<u256> = vector[];
        let vec3: vector<u256> = vector[];

        // creating two pairs of parallel vectors

        vector::push_back(&mut vec1, 10);   // aptos version of push_back
        vector::push_back(&mut vec2, 10);
        vector::push_back(&mut vec3, 10);

        vector::push_back(&mut vec1, 20);
        vector::push_back(&mut vec2, 20);
        vector::push_back(&mut vec3, 20);

        /*
        vec1.push_back(10);
        vec2.push_back(10);
        vec3.push_back(10);

        vec1.push_back(20);
        vec2.push_back(20);
        vec3.push_back(20);
        */

        while(i < 10000){

            // grab the product of vec2[0] and vec2[1] and assign it to vec1[0]
            let mult = *vector::borrow(&vec2, 0) * *vector::borrow(&vec2, 1);
            let vec1_reference = vector::borrow_mut(&mut vec1, 0);
            *vec1_reference = mult;

            i = i + 1;
        };

        
    }

// ====================================================================================

    
// Operations done with fields of a struct
    public entry fun div_vector_fields(){
        let i = 0;
        let v:vector<S1> = vector[];

        // declarations of two structs to be operated on and pushing them to the vector
        let s1 = S1{f1: 10, f2: 10, f3: 10};
        let s2 = S1{f1: 20, f2: 20, f3: 20};

        vector::push_back(&mut v, s1);
        vector::push_back(&mut v, s2);

        //v.push_back(s1);
        //v.push_back(s2);


        // Iterating 10,000 times to create a noticable gas cost difference
        while (i < 10000){

            // Creating an updated instance of s1 with changes to field 1 (f1)
            // f1 becomes the quotient of s2.f2 / s1.f2
            let updated_s1: S1 = S1{f1: s2.f2 / s1.f2, f2: s1.f2, f3: s1.f3};

            // Re-assigning s1 to become an updated version of itself
            s1 = updated_s1;


            i = i + 1;
        };

        //v.destroy_empty();
    }

    
    public entry fun div_parallel(){
        // creating three parallel vectors
        let i = 0;
        let vec1: vector<u256> = vector[];
        let vec2: vector<u256> = vector[];
        let vec3: vector<u256> = vector[];

        // creating two pairs of parallel vectors
        vector::push_back(&mut vec1, 10);   // aptos version of push_back
        vector::push_back(&mut vec2, 10);
        vector::push_back(&mut vec3, 10);

        vector::push_back(&mut vec1, 20);
        vector::push_back(&mut vec2, 20);
        vector::push_back(&mut vec3, 20);

        /*
        vec1.push_back(10); // sui version of push_back()
        vec2.push_back(10);
        vec3.push_back(10);

        vec1.push_back(20);
        vec2.push_back(20);
        vec3.push_back(20);
        */

        while(i < 10000){

            // grab the quotient of vec2[1] / vec2[0] and assign it to vec1[0]
            let quotient = *vector::borrow(&vec2, 1) / *vector::borrow(&vec2, 0);
            let vec1_reference = vector::borrow_mut(&mut vec1, 0);
            *vec1_reference = quotient;

            i = i + 1;
        };

        
    }

    

// -==-=-==--==--==-=-=---=--==--=-=--=-=-=-=--==--=-=-=-=-=-=-=-=-=-==-=-=-==-=--==--==--=-==-


// Operations done with fields of a struct
    public entry fun sub_vector_fields(){
        let i = 0;
        let v:vector<S1> = vector[];

        // declarations of two structs to be operated on and pushing them to the vector
        let s1 = S1{f1: 10, f2: 10, f3: 10};
        let s2 = S1{f1: 20, f2: 20, f3: 20};

        vector::push_back(&mut v, s1);
        vector::push_back(&mut v, s2);

        //v.push_back(s1);
        //v.push_back(s2);


        // Iterating 10,000 times to create a noticable gas cost difference
        while (i < 10000){

            // Creating an updated instance of s1 with changes to field 1 (f1)
            // f1 becomes the difference of s2.f2 - s1.f2
            let updated_s1: S1 = S1{f1: s2.f2 - s1.f2, f2: s1.f2, f3: s1.f3};

            // Re-assigning s1 to become an updated version of itself
            s1 = updated_s1;


            i = i + 1;
        };

        //v.destroy_empty();
    }

    
    public entry fun sub_parallel(){
        // creating three parallel vectors
        let i = 0;
        let vec1: vector<u256> = vector[];
        let vec2: vector<u256> = vector[];
        let vec3: vector<u256> = vector[];

        // creating two pairs of parallel vectors
        vector::push_back(&mut vec1, 10);   // aptos version of push_back
        vector::push_back(&mut vec2, 10);
        vector::push_back(&mut vec3, 10);

        vector::push_back(&mut vec1, 20);
        vector::push_back(&mut vec2, 20);
        vector::push_back(&mut vec3, 20);

        /*
        vec1.push_back(10);
        vec2.push_back(10);
        vec3.push_back(10);

        vec1.push_back(20);
        vec2.push_back(20);
        vec3.push_back(20);
        */

        while(i < 10000){

            // grab the difference of vec2[1] - vec2[0] and assign it to vec1[0]
            let diff = *vector::borrow(&vec2, 1) - *vector::borrow(&vec2, 0);
            let vec1_reference = vector::borrow_mut(&mut vec1, 0);
            *vec1_reference = diff;

            i = i + 1;
        };

        
    }

    

}
