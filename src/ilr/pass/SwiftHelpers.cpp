//
//  SwiftHelpers.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 29/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#include "SwiftHelpers.hpp"

using namespace llvm;



void SwiftHelpers::addFunction(Module& M, Type2FunctionMap& map, const std::string& name, const Type* type) {
    Function *F = M.getFunction(name);
    if (!F)
        errs() << "Definition of function <" << name << "> not found\n";
    assert(F && "swift function not found (requires linked swift-interface");
    
    bool isnew;
    Type2FunctionMap::iterator it;
    std::tie (it, isnew) = map.insert(std::make_pair(type, F));
    assert (isnew && "type collision: function for this type exists already");
    
    helpers.insert(F);
}


SwiftHelpers::SwiftHelpers(Module& M) {
    module = &M;
    addFunction(M, checkers, "SWIFT$check_i8",     Type::getInt8Ty(getGlobalContext()));
    addFunction(M, checkers, "SWIFT$check_i16",    Type::getInt16Ty(getGlobalContext()));
    addFunction(M, checkers, "SWIFT$check_i32",    Type::getInt32Ty(getGlobalContext()));
    addFunction(M, checkers, "SWIFT$check_i64",    Type::getInt64Ty(getGlobalContext()));
    //addFunction(M, checkers, "SWIFT$check_i128",    Type::getInt128Ty(getGlobalContext()));
    addFunction(M, checkers, "SWIFT$check_ptr",    PointerType::getUnqual(Type::getInt8Ty(getGlobalContext())));
    addFunction(M, checkers, "SWIFT$check_double", Type::getDoubleTy(getGlobalContext()));
    addFunction(M, checkers, "SWIFT$check_float",  Type::getFloatTy(getGlobalContext()));
    addFunction(M, checkers, "SWIFT$check_dq",     VectorType::get(Type::getInt64Ty(getGlobalContext()),  2));
    addFunction(M, checkers, "SWIFT$check_pd",     VectorType::get(Type::getDoubleTy(getGlobalContext()), 2));
    addFunction(M, checkers, "SWIFT$check_ps",     VectorType::get(Type::getFloatTy(getGlobalContext()),  4));
    
    addFunction(M, movers, "SWIFT$move_i8",     Type::getInt8Ty(getGlobalContext()));
    addFunction(M, movers, "SWIFT$move_i16",    Type::getInt16Ty(getGlobalContext()));
    addFunction(M, movers, "SWIFT$move_i32",    Type::getInt32Ty(getGlobalContext()));
    addFunction(M, movers, "SWIFT$move_i64",    Type::getInt64Ty(getGlobalContext()));
    //addFunction(M, movers, "SWIFT$move_i128",    Type::getInt128Ty(getGlobalContext()));
    addFunction(M, movers, "SWIFT$move_ptr",    PointerType::getUnqual(Type::getInt8Ty(getGlobalContext())));
    addFunction(M, movers, "SWIFT$move_double", Type::getDoubleTy(getGlobalContext()));
    addFunction(M, movers, "SWIFT$move_float",  Type::getFloatTy(getGlobalContext()));
    addFunction(M, movers, "SWIFT$move_dq",     VectorType::get(Type::getInt64Ty(getGlobalContext()),  2));
    addFunction(M, movers, "SWIFT$move_pd",     VectorType::get(Type::getDoubleTy(getGlobalContext()), 2));
    addFunction(M, movers, "SWIFT$move_ps",     VectorType::get(Type::getFloatTy(getGlobalContext()),  4));
    
    detectedfunc = M.getFunction("SWIFT$detected");
    assert(detectedfunc && "swift function <detected> not found (requires linked swift-interface");
}

// some functions-llvm intrinsics can be treated by swift as
// normal instructions w/o any need to check arguments/copy return value
bool SwiftHelpers::isDuplicatedFunc(Function* F) {
    if (!F)
        return false;
    StringRef fname = F->getName();
    
    if (
        // floating point arithmetic
        fname.startswith("llvm.sqrt.") ||
        fname.startswith("llvm.powi.") ||
        fname.startswith("llvm.sin.") ||
        fname.startswith("llvm.cos.") ||
        fname.startswith("llvm.pow.") ||
        fname.startswith("llvm.exp.") ||
        fname.startswith("llvm.exp2.") ||
        fname.startswith("llvm.log.") ||
        fname.startswith("llvm.log10.") ||
        fname.startswith("llvm.log2.") ||
        fname.startswith("llvm.fma.") ||
        fname.startswith("llvm.fabs.") ||
        fname.startswith("llvm.minnum.") ||
        fname.startswith("llvm.maxnum.") ||
        fname.startswith("llvm.copysign.") ||
        fname.startswith("llvm.floor.") ||
        fname.startswith("llvm.ceil.") ||
        fname.startswith("llvm.trunc.") ||
        fname.startswith("llvm.rint.") ||
        fname.startswith("llvm.nearbyint.") ||
        fname.startswith("llvm.round.") ||
        // bitwise
        fname.startswith("llvm.bswap.") ||
        fname.startswith("llvm.ctpop.") ||
        fname.startswith("llvm.ctlz.") ||
        fname.startswith("llvm.cttz.") ||
        // overflow arithmetic
        fname.startswith("llvm.sadd.with.overflow") ||
        fname.startswith("llvm.uadd.with.overflow") ||
        fname.startswith("llvm.ssub.with.overflow") ||
        fname.startswith("llvm.usub.with.overflow") ||
        fname.startswith("llvm.smul.with.overflow") ||
        fname.startswith("llvm.umul.with.overflow") ||
        // misc
        fname.startswith("llvm.canonicalize.") ||
        fname.startswith("llvm.fmuladd.") ||
        fname.startswith("llvm.convert.") ||
        
        fname.startswith("__dummy__"))
        return true;
    
    return false;
}

bool SwiftHelpers::isIgnoredFunc(Function* F) {
    static std::set<std::string> ignored {
        // Transactifier functions
        "tx_cond_start",
        "tx_start",
        "tx_end",
        "tx_abort",
        "tx_increment",
        "tx_pthread_mutex_lock",
        "tx_pthread_mutex_unlock",
        
        // Intel TSX intrinsics
        "llvm.x86.xtest",
        "llvm.x86.xbegin",
        "llvm.x86.xend",
        "llvm.x86.xabort",
        
        // LLVM intrinsics -- most of them must be ignored
        "llvm.dbg.value",
        "llvm.dbg.declare",
        
        "llvm.returnaddress",
        "llvm.frameaddress",
        "llvm.frameescape",
        "llvm.framerecover",
        
        "llvm.read_register.i32",
        "llvm.read_register.i64",
        "llvm.write_register.i32",
        "llvm.write_register.i64",
        
        //			"llvm.stacksave",
        //			"llvm.stackrestore",
        "llvm.prefetch",
        "llvm.pcmarker",
        "llvm.readcyclecounter",
        "llvm.clear_cache",
        "llvm.instrprof_increment",
        
        "llvm.lifetime.start",
        "llvm.lifetime.end",
        "llvm.invariant.start",
        "llvm.invariant.end",
        
        "llvm.var.annotation",
        "llvm.ptr.annotation.p0",
        "llvm.annotation.i8",
        "llvm.annotation.i16",
        "llvm.annotation.i32",
        "llvm.annotation.i64",
        "llvm.annotation.i256",
        
        "llvm.stackprotector",
        "llvm.stackprotectorcheck",
        
        "llvm.llvm.objectsize.i32",
        "llvm.llvm.objectsize.i64",
        "llvm.expect.i1",
        "llvm.expect.i32",
        "llvm.expect.i64",
        
        "llvm.assume",
        "llvm.bitset.test",
        
        "__dummy__",
        // Exception handling intrinsics
        "llvm.eh.typeid.for",
        "llvm.eh.begincatch",
        "llvm.eh.endcatch",
        "llvm.eh.exceptionpointer",
        //EH SJLJ intrinsics
        "llvm.eh.sjlj.setjmp",
        "llvm.eh.sjlj.longjmp",
        "llvm.eh.sjlj.lsda",
        "llvm.eh.sjlj.callsite"
    };
    
    if (!F) {
        // conservative about function pointers
        return false;
    }
    
    if (helpers.count(F) || ignored.count(F->getName())) {
        // function is Swift helper function or in a list of ignored
        return true;
    }
    return false;
}
