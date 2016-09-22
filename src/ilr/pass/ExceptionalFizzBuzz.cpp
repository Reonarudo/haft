//
//  ExceptionalFizzBuzz.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 14/08/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//
#include <stdio.h>
#include <iostream>

int main ()
{
    for(int i = 1; i <= 10000000; i++)
    {
        std::string res;
        try {
            if(i % 3 == 0 && i % 5 == 0)
                res="FizzBuzz";
            else if(i % 3==0)
                throw "Fizz";
            else if(i % 5==0)
                throw "Buzz";
            else
                throw i;
        } catch (char const* excStr) {
            res = excStr;
        } catch (int excInt){
            res = std::to_string(excInt);
        }
        std::cout << res << "\n";
    }
    return 0;
}