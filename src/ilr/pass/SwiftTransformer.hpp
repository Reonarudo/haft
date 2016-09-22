//
//  SwiftTransformer.hpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 29/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#ifndef SwiftTransformer_hpp
#define SwiftTransformer_hpp

#include "SwiftHelpers.hpp"
#include "ValueShadowMap.hpp"
#include <iostream>
#include <map>
#include <stdio.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/Casting.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/LoopIterator.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

// --- uncomment if you'd like to activate some optimization ---

// remove swift-checks right after swift-moves
//#define SWIFT_OPTIMIZE_IMMEDIATE_CHECKS

// distinguish between different types of loads/stores (atomic vs regular);
// if not defined, every mem access is conservatively treated as atomic
#define SWIFT_OPTIMIZE_SHARED_MEMORY_ACCESSES

// optimization to explicitly check local loop vars before Tx-end
// NOTE: assumes a later Trans pass, does not alter behaviour w/o it
#define SWIFT_INSERT_CHECKS_ON_LOOP_HEADERS

// optimization to insert shadow basic blocks for simple control flow
// on the status register; if not defined, branch condition is checked
// via usual swift-check
#define SWIFT_SIMPLE_CONTROL_FLOW

static const std::string CLONE_SUFFIX(".swift");
typedef std::map<std::pair<Type*, uint64_t>, GlobalVariable*> GlobalConstMap;
typedef std::map<BasicBlock*, Instruction*> Inst2ShadowInBBMap;


class SwiftTransformer {
    
    SwiftHelpers* swiftHelpers;
    ValueShadowMap shadows;
    std::vector<PHINode*> phis;
    std::vector<BranchInst*> brs;
    std::set<Instruction*> dontcheck;
    BasicBlock* detectedBB = nullptr;
    
    unsigned long next_id = 0;
    
    Value* castToSupportedType(IRBuilder<>& irBuilder, Value* v);
    void createCheckerCall(IRBuilder<>& irBuilder, Value* v1, Value* v2, bool movev2);
    Instruction* createMoveCall(IRBuilder<>& irBuilder, Value* v);
    Instruction* createMoveCall(IRBuilder<>& irBuilder, Value* v, bool dontcheckInst);
    void shadowInstOperands(Instruction* I, Instruction* shadow);
    void checkInstOperands(Instruction* I, IRBuilder<> irBuilder);
    
public:
    
    void shadowInst(Instruction* I);
    void checkInst(Instruction* I);
    void shadowArgs(Function& F, Instruction* firstI);
    void rewireShadowPhis();
    bool requiresCheckTransitive(Loop* L, Value* V);
    void insertChecksOnLoopHeader(Loop* L, DominatorTree* DT);
    void insertChecksOnLoopHeaders(LoopInfo &LI, DominatorTree* DT);
    void addShadowBasicBlocks(BranchInst* BI);
    void addControlFlowChecks();
    //void addInvokeChecks(Function& F);
    SwiftTransformer(SwiftHelpers* inSwiftHelpers);
};

#endif /* SwiftTransformer_hpp */
