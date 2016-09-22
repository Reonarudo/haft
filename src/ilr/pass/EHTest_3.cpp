//
//  EHTest.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 08/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

typedef int (*FunPoint)(int);

__attribute__((noinline))
int fn(int argument){
    return argument;
}

__attribute__((noinline))
int will_Throw_An_Exception(int argument){
    FunPoint fnpt = fn;
    throw fnpt;
    return 1;
}
__attribute__((noinline))
int runs_After_Exception_Is_Caught(FunPoint argument){
    return argument(42);
}



int main(){
    int result=42;
    
    try {
        result=will_Throw_An_Exception(result);
    } catch (FunPoint exception_value) {
        result=runs_After_Exception_Is_Caught(exception_value);
    }
    
    return result;
}