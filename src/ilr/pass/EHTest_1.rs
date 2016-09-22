//
//  EHTest.rs
//  LLVMPasses
//
//  Created by Leonardo Marques on 08/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//


fn will_Throw_An_Exception(int argument)->int{
    throw argument;
    return 1;
}
int runs_After_Exception_Is_Caught(int argument){
return 2+argument;
}

int main(){
int result=0;
try {
result=will_Throw_An_Exception(result);
} catch (int exception_value) {
result=runs_After_Exception_Is_Caught(exception_value);
}

return result;
}