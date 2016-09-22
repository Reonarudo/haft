//
//  EHBubbleSort.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 02/08/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#include <stdio.h>
#include <iostream>

int* swap(int pos1, int pos2, int* arr){
    int swap;
    swap       = arr[pos1];
    arr[pos1]   = arr[pos2];
    arr[pos2] = swap;
    
    return arr;
}

int main(int argc, char* argv[])
{
    if (argc!=2) {
        std::cout <<"give number of elements to sort";
        return -1;
    }
    
    int nElem=atoi(argv[1]);
    int *array;
    try {
        array=new int[nElem];
    } catch (std::bad_alloc exception) {
        std::cout <<"Failled to alloc memory for all elements";
        return -1;
    }
    
    int n, c, d;
    
    //fill array
    for(int i=0;i<nElem;i++){
        array[i]= rand() % nElem;
    }
    
    
    
    for (c = 0 ; c < ( n - 1 ); c++)
    {
        for (d = 0 ; d < n - c - 1; d++)
        {
            try {
                if (array[d] > array[d+1]) /* For decreasing order use < */
                {
                    array=swap(d,d+1, array);
                }
            } catch (int ex) {
                
            }
            
            
        }
    }
    
    printf("Sorted list in ascending order:\n");
    
    for ( c = 0 ; c < n ; c++ )
        printf("%d\n", array[c]);
    
    return 0;
}