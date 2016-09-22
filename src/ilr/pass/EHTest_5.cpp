//
//  EHTest.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 08/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

__attribute__((noinline))
int fn(int argument){
    return argument;
}

__attribute__((noinline))
int will_Throw_An_Exception(int argument){
    int (*fnpt)(int) = fn;
    throw fnpt(argument);
    return 1;
}
__attribute__((noinline))
int runs_After_Exception_Is_Caught(int argument){
    return 2+argument;
}

int main(){
    int result=0;
    while (true) {
        try {
            
            if(result%2==0)
                result=result*result;
            else if (result>42){
                result=will_Throw_An_Exception(result);
                break;
            }
            
            
            
        } catch (int exception_value) {
            result=runs_After_Exception_Is_Caught(exception_value);
        }
        result+=1;
    }
    return result;
}