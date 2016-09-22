//
//  FizzBuzz.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 13/08/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#include <iostream>
int main ()
{
    for(int i = 1; i <= 100; i++)
    {
        std::string res=i % 3 == 0 && i % 5 == 0 ? "FizzBuzz" : i % 3 == 0 ? "Fizz" : i % 5 == 0 ? "Buzz" : std::to_string(i);
        std::cout << res << "\n";
    }
    return 0;
}