//===---------- ilr.cpp - ILR-harden pass ---------------------------------===//
//
//	 This pass duplicates all instructions (instruction-level-replication) and
//   inserts checks at synchronization points: stores, branches, calls, etc.
//
//   TODO: previously was called "SWIFT" since the idea is taken from:
//           http://liberty.cs.princeton.edu/Publications/cgo3_swift.pdf
//         change to ILR eveywhere at some point...
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "ILR"

// --- uncomment if you'd like to activate some optimization ---

// remove swift-checks right after swift-moves
#define SWIFT_OPTIMIZE_IMMEDIATE_CHECKS

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

#include <llvm/Pass.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Intrinsics.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Support/Casting.h>
#include <llvm/IR/Dominators.h>
#include <llvm/ADT/DepthFirstIterator.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/LoopIterator.h>
#include <llvm/Support/CommandLine.h>

#include <iostream>
#include <map>
#include <set>
#include <sstream>
#include <utility>
#include <memory>
#include <tuple>

#include "SwiftHelpers.hpp"
#include "ValueShadowMap.hpp"
#include "SwiftTransformer.hpp"

using namespace llvm;

namespace {
    
    static const std::string CLONE_SUFFIX(".swift");
    typedef std::map<const Type*, Function*> Type2FunctionMap;
    
    
    class SwiftPass : public FunctionPass {
        SwiftHelpers* swiftHelpers;
        
    public:
        static char ID; // Pass identification, replacement for typeid
        
        SwiftPass(): FunctionPass(ID) { }
        
        virtual bool doInitialization(Module& M) {
            swiftHelpers = new SwiftHelpers(M);
            return true;
        }
        
        virtual bool runOnFunction(Function &F) {
            std::set<BasicBlock*> visited;
            errs() << "Started function" << F.getName() <<"\n";
            if (swiftHelpers->isIgnoredFunc(&F)) return false;
            
            DominatorTree& DT = getAnalysis<DominatorTreeWrapperPass>().getDomTree();
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
            SwiftTransformer swifter(swiftHelpers);
            
            bool shadowedArgs = false;
            
            // walk through BBs in the dominator tree order
            for (df_iterator<DomTreeNode*> DI = df_begin(DT.getRootNode()),	E = df_end(DT.getRootNode()); DI != E; ++DI){
                BasicBlock *BB = DI->getBlock();
                visited.insert(BB);
                
                for (BasicBlock::iterator instIt = BB->begin (); instIt != BB->end (); ) {
                    // Swift can add instructions after the current instruction,
                    // so we first memorize the next original instruction and after
                    // modifications we jump to it, skipping swift-added ones
                    BasicBlock::iterator nextIt = std::next(instIt);
                    
                    if (!shadowedArgs) {
                        swifter.shadowArgs(F, &*instIt);
                        shadowedArgs = true;
                    }
                    
                    swifter.checkInst (&*instIt);
                    swifter.shadowInst (&*instIt);
                    
                    instIt = nextIt;
                }
            }
            
            // walk through BBs not covered by dominator tree (case for landing pads)
            for (Function::iterator BB = F.begin(), BE = F.end(); BB != BE; ++BB) {
                //Check if it was already visited by being in the dominator tree
                if (visited.count(&*BB) > 0)
                    continue;
                
                for (BasicBlock::iterator instIt = BB->begin (); instIt != BB->end (); ) {
                    BasicBlock::iterator nextIt = std::next(instIt);
                    swifter.checkInst (&*instIt);
                    swifter.shadowInst (&*instIt);
                    instIt = nextIt;
                }
            }
            errs() << "Checked BBs\n";
            swifter.rewireShadowPhis();
            errs() << "Rewired Shadow PHIs\n";
            swifter.insertChecksOnLoopHeaders(LI, &DT);
            errs() << "Inserted checks on loop headers\n";
            swifter.addControlFlowChecks();
            errs() << "Added control flow checks\n";
            
            
            
            for (Function::iterator BB = F.begin(), BE = F.end(); BB != BE; ++BB){
                for (BasicBlock::iterator instIt = BB->begin (); instIt != BB->end (); ) {
                    
                    Instruction *I = &*instIt;
                    
                    
                    instIt = std::next(instIt);
                    
                    if (!isa<CallInst>(I))
                        continue;
                    
                    CallInst* call = cast<CallInst>(I);
                    
                    if (!call->getCalledFunction() || call->getCalledFunction()->getName() == "")
                        continue;
                    
                    if (swiftHelpers->helpers.count(call->getCalledFunction()) == 0)
                        continue;
                    
                    if (call->getCalledFunction()->getName().count("move") == 0)
                        continue;
                    errs() << I->getOpcodeName() <<" :"<< call->getCalledFunction()->getName() << "|"<< I->getNumUses()  <<"\n";
                    // it's a swift-move!
                    if (I->getNumUses() == 0) {
                        BasicBlock::iterator toerase(I);
                        toerase->eraseFromParent();
                    }
                }
            }
            
            errs() << "Ended \n";
            // inform that we always modify a function
            return true;
        }
        
        virtual bool doFinalization(Module& M) {
            delete swiftHelpers;
            return false;
        }
        
        virtual void getAnalysisUsage(AnalysisUsage& UA) const {
            UA.addRequired<LoopInfoWrapperPass>();
            UA.addPreserved<LoopInfoWrapperPass>();
            UA.addRequired<DominatorTreeWrapperPass>();
            FunctionPass::getAnalysisUsage(UA);
        }
    };
    
    char SwiftPass::ID = 0;
    static RegisterPass<SwiftPass> X("ilr2", "ILR Pass");
    
}
