//
//  ValueShadowMap.hpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 29/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#ifndef ValueShadowMap_hpp
#define ValueShadowMap_hpp

#include <stdio.h>
#include <map>
#include <iostream>
#include <sstream>
#include <utility>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/Casting.h>

#include <llvm/IR/PassManager.h>


using namespace llvm;
class ValueShadowMap{
    typedef std::map<Value*, Value*> ValueShadowMapType;
    ValueShadowMapType vsm;
public:
    ValueShadowMap();
    //Add shadow instruction
    void add(Value* v, Value* shadow);
    //Get shadow value
    Value* getShadow(Value *v, Value *inst_debug);
    //has shadow instruction
    bool hasShadow(Value *v);
};
#endif /* ValueShadowMap_hpp */
