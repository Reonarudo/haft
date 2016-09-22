//
//  EHTest.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 08/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

__attribute__((noinline))
int will_Throw_An_Exception(int argument){
    throw argument;
    return 1;
}
__attribute__((noinline))
int runs_After_Exception_Is_Caught(int argument){
    return 2+argument;
}

__attribute__((noinline))
int fn(int argument){
    return argument;
}

int main(){
    int result=42;
    int (*fnpt)(int) = fn;
    try {
        result=will_Throw_An_Exception(result);
    } catch (int exception_value) {
        result=fnpt(exception_value);
    }
    
    return result;
}