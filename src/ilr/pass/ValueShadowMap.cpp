//
//  ValueShadowMap.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 29/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#include "ValueShadowMap.hpp"

ValueShadowMap::ValueShadowMap(): vsm() {}

void ValueShadowMap::add(Value* v, Value* shadow) {
    bool isnew;
    ValueShadowMapType::iterator it;
    
    std::tie(it, isnew) = vsm.insert(std::make_pair(v, shadow));
    assert (isnew && "value already has a shadow");
}

Value* ValueShadowMap::getShadow(Value *v, Value *inst_debug) {
    // no checks for constants, BBs (labels), function declarations, inline asm and metadata
    if (isa<Constant>(v) || isa<BasicBlock>(v) || isa<Function>(v) ||
        isa<InlineAsm>(v) || isa<MetadataAsValue>(v) ||
        isa<LandingPadInst>(v))
        return nullptr;
    
    ValueShadowMapType::iterator it = vsm.find(v);
    
    if (it == vsm.end()){
        errs() << "Value '" << *v << "' has no shadow (for Instr '" << *inst_debug << "')\n";
    }
    assert(it != vsm.end() && "value has no shadow");
    
    return it->second;
}

bool ValueShadowMap::hasShadow(Value *v) {
    return vsm.end() != vsm.find(v);
}

