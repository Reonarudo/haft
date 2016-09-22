//
//  EHTest.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 08/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#include <iostream>

typedef struct StructType{
    int innerType1;
    double innerType2;
} StructType;

__attribute__((noinline))
int will_Throw_An_IntException(int argument){
    throw 1;
    return 1;
}
__attribute__((noinline))
int will_Throw_An_DoubleException(int argument){
    throw 2.0;
    return 1;
}
__attribute__((noinline))
int will_Throw_An_FloatException(int argument){
    throw 3.0f;
    return 1;
}
__attribute__((noinline))
int will_Throw_An_StructException(int argument){
    StructType structVal={1,1.0};
    throw structVal;
    return 1;
}

__attribute__((noinline))
int runs_After_IntException_Is_Caught(int argument){
    return 1+argument;
}

__attribute__((noinline))
int runs_After_DoubleException_Is_Caught(double argument){
    return 2+argument;
}

__attribute__((noinline))
int runs_After_FloatException_Is_Caught(float argument){
    return 3+argument;
}

__attribute__((noinline))
int runs_After_StructException_Is_Caught(StructType argument){
    return 3+argument.innerType1;
}



int main(){
    int result = 0, i=0;
    while (true) {
        try {
            if(i==10){
                break;
            }
            switch (i%4) {
                case 0:
                    result=will_Throw_An_IntException(i);
                    break;
                case 1:
                    result=will_Throw_An_DoubleException(i);
                    break;
                case 2:
                    result=will_Throw_An_FloatException(i);
                    break;
                default:
                    result=will_Throw_An_StructException(i);
                    break;
            }
            
            
        } catch (int exception_value) {
            result+=runs_After_IntException_Is_Caught(exception_value);
        } catch (double exception_value) {
            result+=runs_After_DoubleException_Is_Caught(exception_value);
        } catch (float exception_value) {
            result+=runs_After_FloatException_Is_Caught(exception_value);
        }catch (StructType exception_value) {
            result+=runs_After_StructException_Is_Caught(exception_value);
        }
        i+=1;
        std::cout << "Result = " << result <<"\n";
    }
    
    return result;
}