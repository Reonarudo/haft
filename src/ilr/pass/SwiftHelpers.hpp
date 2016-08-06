//
//  SwiftHelpers.hpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 29/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#ifndef SwiftHelpers_hpp
#define SwiftHelpers_hpp

#include <stdio.h>
#include <llvm/Pass.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Function.h>

#include <llvm/IR/Type.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>


#include <iostream>
#include <map>
#include <set>
#include <sstream>
#include <utility>
#include <memory>
#include <tuple>

using namespace llvm;
typedef std::map<const Type*, Function*> Type2FunctionMap;
class SwiftHelpers {
private:
    void addFunction(Module& M, Type2FunctionMap& map, const std::string& name, const Type* type);
public:
    Type2FunctionMap movers;
    Type2FunctionMap checkers;
    Function* detectedfunc;
    std::set<Function*> helpers;
    Module* module;
    
    SwiftHelpers(Module& M);
    bool isDuplicatedFunc(Function* F);
    bool isIgnoredFunc(Function* F);
    
};


#endif /* SwiftHelpers_hpp */
