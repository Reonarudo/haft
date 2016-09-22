//
//  EHBenchmark_1.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 21/07/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#include <stdio.h>
#include <iostream>

int shouldThrowInt(int i){
    throw i;
    return i;
}
int shouldThrowDouble(int i){
    throw i*1.0;
    return i;
}

// When passing char arrays as parameters they must be pointers
int main(int argc, char* argv[]) {
    if (argc < 2) { // Check the value of argc. If not enough parameters have been passed, inform user and exit.
        std::cout << "Usage is <n thrown exceptions>\n"; // Inform the user of how to use the program
        std::cin.get();
        exit(0);
    } else { // if we got enough parameters...
        int nExc=atoi(argv[1]);
        int nCaughtExceptions=0;
        for(int i=0; i<nExc; i++){
            int failedToThrow=-1;
            try{
                if(i%2==0)
                    failedToThrow=shouldThrowInt(i);
                else
                    failedToThrow=shouldThrowDouble(i);
            }catch(int exception){
                nCaughtExceptions+=1;
            }catch(double exception){
                nCaughtExceptions+=1;
            }
            if(failedToThrow>0)
                std::cout << "Failed To Throw:" << failedToThrow;
        }
        
        return nCaughtExceptions;
    }
}