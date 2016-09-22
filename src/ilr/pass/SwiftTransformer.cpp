//
//  SwiftTransformer.cpp
//  LLVMPasses
//
//  Created by Leonardo Marques on 29/06/16.
//  Copyright © 2016 LEMA Microsystems. All rights reserved.
//

#include "SwiftTransformer.hpp"

GlobalConstMap globalconsts;
Inst2ShadowInBBMap excHand2Check;

//Turns an unsupported value type into a supported one
Value* SwiftTransformer::castToSupportedType(IRBuilder<>& irBuilder, Value* v) {
    Type *Ty = v->getType();
    
    switch (Ty->getTypeID()) {
        case Type::IntegerTyID: {
            Type* TargetType = Type::getInt128Ty(getGlobalContext());
            if (Ty->getPrimitiveSizeInBits() == 8)
                TargetType = Type::getInt8Ty(getGlobalContext());
            else if (Ty->getPrimitiveSizeInBits() == 16)
                TargetType = Type::getInt16Ty(getGlobalContext());
            else if (Ty->getPrimitiveSizeInBits() == 32)
                TargetType = Type::getInt32Ty(getGlobalContext());
            else if (Ty->getPrimitiveSizeInBits() == 64)
                TargetType = Type::getInt64Ty(getGlobalContext());
            else if (Ty->getPrimitiveSizeInBits() == 128)
                TargetType = VectorType::get(Type::getInt64Ty(getGlobalContext()), 2);
            
            if (Ty->getPrimitiveSizeInBits() < TargetType->getPrimitiveSizeInBits())
                v = irBuilder.CreateZExt(v, TargetType, "swift.intcast");
        }
            break;
            
        case Type::PointerTyID: {
            Type* TyPtrToI8 = PointerType::getUnqual(Type::getInt8Ty(getGlobalContext()));
            if (Ty != TyPtrToI8)
                v = irBuilder.CreateBitCast(v, TyPtrToI8, "swift.ptrcast");
        }
            break;
            
        case Type::DoubleTyID:
        case Type::FloatTyID:
            break;
            
        case Type::HalfTyID: {
            // TODO: this can change the precision, ignore?
            v = irBuilder.CreateFPExt(v, Type::getFloatTy(getGlobalContext()), "swift.halfcast");
        }
            break;
            
        case Type::X86_FP80TyID: {
            // TODO: this can change the precision, ignore?
            v = irBuilder.CreateFPTrunc(v, Type::getDoubleTy(getGlobalContext()), "swift.fp80cast");
        }
            break;
            
        case Type::VectorTyID: {
            Type* TyVecInt64  = VectorType::get(Type::getInt64Ty(getGlobalContext()), 2);
            Type* TyVecInt32  = VectorType::get(Type::getInt32Ty(getGlobalContext()), 4);
            Type* TyVecInt16  = VectorType::get(Type::getInt16Ty(getGlobalContext()), 8);
            Type* TyVecInt8  = VectorType::get(Type::getInt8Ty(getGlobalContext()), 16);
            Type* TyVecFloat  = VectorType::get(Type::getFloatTy(getGlobalContext()), 4);
            Type* TyVecDouble = VectorType::get(Type::getDoubleTy(getGlobalContext()), 2);
            
            Type* VecTy = Ty->getVectorElementType();
            if (VecTy->isIntegerTy() && Ty != TyVecInt64) {
                unsigned NumEl = cast<VectorType>(Ty)->getNumElements();
                if (NumEl == 2) {
                    // it's <2 x iX> but not <2 x i64>, zero-extend
                    v = irBuilder.CreateZExt(v, TyVecInt64);
                } else if (NumEl == 4 && Ty != TyVecInt32) {
                    // it's <4 x iX> but not <4 x i32>, zero-extend
                    v = irBuilder.CreateZExt(v, TyVecInt32);
                } else if (NumEl == 8 && Ty != TyVecInt16) {
                    // it's <8 x iX> but not <8 x i16>, zero-extend
                    v = irBuilder.CreateZExt(v, TyVecInt16);
                } else if (NumEl == 16 && Ty != TyVecInt8) {
                    // it's <16 x iX> but not <16 x i8>, zero-extend
                    v = irBuilder.CreateZExt(v, TyVecInt8);
                }
                // now it's <4 x i32> or <8 x i16> or <16 x i8> or <2 x i64>
                v = irBuilder.CreateBitCast(v, TyVecInt64, "swift.intveccast");
            } else
                if (VecTy->isFloatTy()   && Ty != TyVecFloat) {
                    // TODO: <2 x float> FP-extended to <2 x double>, can change
                    //        results of computation
                    v = irBuilder.CreateFPExt(v, TyVecDouble, "swift.floatveccast");
                } else
                    if (VecTy->isPointerTy()) {
                        // assuming pointers are always 64-bit wide and coming in pairs
                        assert(cast<VectorType>(Ty)->getNumElements() == 2 && "we support only <2 x iX*>");
                        v = irBuilder.CreatePtrToInt(v, TyVecInt64, "swift.ptrveccast");
                    }
        }
            break;
            
        default:
            errs() << "don't know how to handle type " << *Ty << "\n";
            assert(!"cannot create check for this type");
            break;
    }
    return v;
}

//Creates the checker call
//  z = add x, y
//  z2 = add x2, y2
//  d = cmp neq z, z2 <
//  br d, crash
//  ret z
//

void SwiftTransformer::createCheckerCall(IRBuilder<>& irBuilder, Value* v1, Value* v2, bool movev2) {
    
    if (v1->getType() != v2->getType()) {
        errs() << "types of v1 (" << *v1 << ") and v2 (" << *v2 << ") must be the same";
    }
    assert(v1->getType() == v2->getType() && "types of v1 and v2 must be the same");
    
    //Special check for structs ?????
    if (StructType *st = dyn_cast<StructType>(v1->getType())) {
        // complex struct type, need to compare each struct's field
        for (unsigned i = 0; i < st->getNumElements(); ++i) {
            Value *f1 = irBuilder.CreateExtractValue(v1, ArrayRef<unsigned>(i));
            Value *f2 = irBuilder.CreateExtractValue(v2, ArrayRef<unsigned>(i));
            createCheckerCall(irBuilder, f1, f2, movev2);
        }
        return;
    }
    
#ifdef SWIFT_OPTIMIZE_IMMEDIATE_CHECKS
    if (CallInst *call = dyn_cast<CallInst>(v2))
        if (call->getCalledFunction() && swiftHelpers->helpers.count(call->getCalledFunction())) {
            // requested check for v2 (shadow) is immediately after v2's swift-move
            // -> no need to make a check because: (1) it's not a result of execution and
            //    (2) we assume that a very short time passed before move and check
            return;
        }
#endif
    
    //Turns v1 and v2 into supported types
    v1 = castToSupportedType(irBuilder, v1);
    v2 = castToSupportedType(irBuilder, v2);
    
    //What is the checker function for a specific type for? What does it check?
    Type2FunctionMap::iterator it = swiftHelpers->checkers.find(v1->getType());
    if (it == swiftHelpers->checkers.end())
        errs() << "don't know how to handle type " << *(v1->getType()) << "\n";
    assert (it != swiftHelpers->checkers.end() && "no checker function found for specified type");
    
    // store checks do not need to move v2 (because they do volatile reload),
    // so for them movev2 = false; but other checks need a swift-move
    // such that codegen does not move the check for optimization
    if (movev2) {
        //What is the mover function for a specific type for? What does it move?
        Type2FunctionMap::iterator it2 = swiftHelpers->movers.find(v2->getType());
        if (it2 == swiftHelpers->movers.end())
            errs() << "don't know how to handle type " << *(v2->getType()) << "\n";
        assert (it2 != swiftHelpers->movers.end() && "no mover function found for specified type");
        //Creates a swift.movetocheck call or renames the it2->second calle to swift.movetocheck and gives it v2 as argument
        //How is this related with Instruction* createMoveCall(IRBuilder<>& irBuilder, Value* v)?
        v2 = irBuilder.CreateCall(it2->second, v2, "swift.movetocheck");
    }
    
    Value* id = ConstantInt::get(Type::getInt32Ty(getGlobalContext()), next_id++);
    
    std::vector<Value*> argsVec;
    argsVec.push_back(v1);
    argsVec.push_back(v2);
    argsVec.push_back(id);
    ArrayRef<Value*> argsRef(argsVec);
    //passes the arguments to it->second (callee)
    irBuilder.CreateCall(it->second, argsRef);
}

Instruction* SwiftTransformer::createMoveCall(IRBuilder<>& irBuilder, Value* v){
    return createMoveCall(irBuilder,v, false);
}

Instruction* SwiftTransformer::createMoveCall(IRBuilder<>& irBuilder, Value* v, bool dontcheckInst) {
    if (StructType *st = dyn_cast<StructType>(v->getType())) {
        
        // complex struct type, need to move each struct's field
        Value *newstruct = UndefValue::get(st);
        
        for (unsigned i = 0; i < st->getNumElements(); ++i) {
            Value *f = irBuilder.CreateExtractValue(v, ArrayRef<unsigned>(i));
            Value *shadow = createMoveCall(irBuilder, f, dontcheckInst);
            newstruct = irBuilder.CreateInsertValue(newstruct, shadow, ArrayRef<unsigned>(i));
            if(dontcheckInst){
                //dontcheck.insert(cast<Instruction>(shadow));
                dontcheck.insert(cast<Instruction>(newstruct));
                dontcheck.insert(cast<Instruction>(f));
            }
        }
        newstruct->setName(v->getName() + CLONE_SUFFIX);
        return cast<Instruction>(newstruct);
    }
    
    Type* origType = v->getType();
    v = castToSupportedType(irBuilder, v);
    if(dontcheckInst)
        dontcheck.insert(cast<Instruction>(v));
    Type2FunctionMap::iterator it = swiftHelpers->movers.find(v->getType());
    if (it == swiftHelpers->movers.end())
        errs() << "don't know how to handle type " << *(v->getType()) << "\n";
    assert (it != swiftHelpers->movers.end() && "no mover function found for specified type");
    
    Instruction *move = irBuilder.CreateCall(it->second, v, v->getName() + CLONE_SUFFIX);
    if(dontcheckInst)
        dontcheck.insert(move);
    if (v->getType() != origType) {
        // we could cast from original ptr type to i8*, need to cast back
        if (v->getType()->isPointerTy()){
            //errs() << "PinPoint3\n";
            move = cast<Instruction>(irBuilder.CreateBitCast(move, origType, v->getName() + CLONE_SUFFIX));
        }else if (v->getType()->isIntegerTy()){
            // we could zero-extend original int to bigger int, need to trunc back
            move = cast<Instruction>(irBuilder.CreateTrunc(move, origType, v->getName() + CLONE_SUFFIX));
        }else if (v->getType()->isFloatTy() && origType->isHalfTy()){
            // we could extend from half-float to float, need to trunc back
            move = cast<Instruction>(irBuilder.CreateFPTrunc(move, origType, v->getName() + CLONE_SUFFIX));
        }else if (v->getType()->isDoubleTy() && origType->isX86_FP80Ty()){
            // we could trunc from fp80 to double, need to extend back
            move = cast<Instruction>(irBuilder.CreateFPExt(move, origType, v->getName() + CLONE_SUFFIX));
        }else if (v->getType()->isVectorTy() && origType->getVectorElementType()->isIntegerTy()) {
            // we could have a vector of non-64-bit integers, need to cast back
            Type* TyVecInt64  = VectorType::get(Type::getInt64Ty(getGlobalContext()), 2);
            Type* TyVecInt32  = VectorType::get(Type::getInt32Ty(getGlobalContext()), 4);
            Type* TyVecInt16  = VectorType::get(Type::getInt16Ty(getGlobalContext()), 8);
            Type* TyVecInt8  = VectorType::get(Type::getInt8Ty(getGlobalContext()), 16);
            
            unsigned NumEl = cast<VectorType>(origType)->getNumElements();
            switch (NumEl) {
                case 2: move = cast<Instruction>(irBuilder.CreateBitCast(move, TyVecInt64)); break;
                case 4: move = cast<Instruction>(irBuilder.CreateBitCast(move, TyVecInt32)); break;
                case 8: move = cast<Instruction>(irBuilder.CreateBitCast(move, TyVecInt16)); break;
                case 16: move = cast<Instruction>(irBuilder.CreateBitCast(move, TyVecInt8)); break;
            }
            
            if ((NumEl == 2 && origType != TyVecInt64) ||
                (NumEl == 4 && origType != TyVecInt32) ||
                (NumEl == 8 && origType != TyVecInt16) ||
                (NumEl == 16 && origType != TyVecInt8)) {
                //from CreateBitCast in switch
                if(dontcheckInst)
                    dontcheck.insert(move);
                move = cast<Instruction>(irBuilder.CreateTrunc(move, origType));
            }
            move->setName(v->getName() + CLONE_SUFFIX);
        }else if (v->getType()->isVectorTy() && origType->getVectorElementType()->isFloatTy()) {
            // we could have a <2 x float> FP-extended to <2 x double>, need to trunc back
            move = cast<Instruction>(irBuilder.CreateFPTrunc(move, origType, v->getName() + CLONE_SUFFIX));
        }else if (v->getType()->isVectorTy() && origType->getVectorElementType()->isPointerTy()) {
            // we could have a <2 x iX*> (pair of pointers) casted to <2 x i64>, need to cast back
            move = cast<Instruction>(irBuilder.CreateIntToPtr(move, origType, v->getName() + CLONE_SUFFIX));
        }
    }
    if(dontcheckInst)
        dontcheck.insert(move);
    return move;
}

void SwiftTransformer::shadowInstOperands(Instruction* I, Instruction* shadow) {
    errs() << "shadowInstOperands("<< *I << ", " << *shadow << ")\n";
    for (unsigned i = 0; i < shadow->getNumOperands(); ++i) {
        Value *op = I->getOperand(i);
        Value *shadowOp = shadows.getShadow(op, I);
        if (shadowOp){
            shadow->setOperand(i, shadowOp);
        }
    }
}

void SwiftTransformer::checkInstOperands(Instruction* I, IRBuilder<> irBuilder) {
    for (User::op_iterator op = I->op_begin(); op != I->op_end(); ++op) {
        Value *shadowop = shadows.getShadow(*op, I);
        if (shadowop)
            createCheckerCall(irBuilder, *op, shadowop, false);
    }
}

//Shadows given instruction
void SwiftTransformer::shadowInst(Instruction* I) {
    //errs() << "SInside\n";
    //it does not shadow void instructions
    if (I->use_empty())
        return;
    //errs() << "Shadowing: " << *I <<"\n";
#if 0
    if (I->isTerminator())
        errs() << I->getParent()->getParent()->getName() << "::  cannot shadow terminator instruction " << *I << "\n";
    assert (!I->isTerminator() && "cannot shadow terminator instruction");
#endif
    
    // add shadow instruction(s) after I
    BasicBlock::iterator instIt(I);
    IRBuilder<> irBuilder(instIt->getParent(), ++instIt);
    
    switch (I->getOpcode()) {
            /* Standard binary operators */
        case Instruction::Add:
        case Instruction::FAdd:
        case Instruction::Sub:
        case Instruction::FSub:
        case Instruction::Mul:
        case Instruction::FMul:
        case Instruction::UDiv:
        case Instruction::SDiv:
        case Instruction::FDiv:
        case Instruction::URem:
        case Instruction::SRem:
        case Instruction::FRem:
            /* Logical operators */
        case Instruction::And:
        case Instruction::Or:
        case Instruction::Xor:
            /* Memory instructions */
        case Instruction::GetElementPtr: /* other insts are with checks */
            /* Convert instructions */
        case Instruction::Trunc:
        case Instruction::ZExt:
        case Instruction::SExt:
        case Instruction::FPTrunc:
        case Instruction::FPExt:
        case Instruction::FPToUI:
        case Instruction::FPToSI:
        case Instruction::UIToFP:
        case Instruction::SIToFP:
        case Instruction::IntToPtr:
        case Instruction::PtrToInt:
        case Instruction::BitCast:
            /* Other instructions */
        case Instruction::ICmp:
        case Instruction::FCmp:
        case Instruction::Select:
        case Instruction::Shl:
        case Instruction::LShr:
        case Instruction::AShr:
        case Instruction::ExtractElement:
        case Instruction::InsertElement:
        case Instruction::ShuffleVector:
        case Instruction::ExtractValue:
        case Instruction::InsertValue:
            /* Loads */
        case Instruction::Load: {
            if (LoadInst* load = dyn_cast<LoadInst>(I)) {
#ifdef SWIFT_OPTIMIZE_SHARED_MEMORY_ACCESSES
                if (isa<GlobalVariable>(load->getPointerOperand())) {
                    // optimization: if load global variable, we know that
                    // address is constant and no need to load twice
                    // NOTE: this optimization is also ad-hoc solution to
                    //       race conditions on synchronization flags --
                    //       they are usually declared as globals
                    Instruction *shadow = createMoveCall(irBuilder, I);
                    shadows.add(I, shadow);
                    break;
                }
                if (load->isAtomic()) {
                    // atomic loads work on shared non-locked data, we must not
                    // load twice, otherwise can load two inconsistent copies
                    // (see also checkInst)
                    Instruction *shadow = createMoveCall(irBuilder, I);
                    shadows.add(I, shadow);
                    break;
                }
#else
                // conservatively treat all loads as atomics
                Instruction *shadow = createMoveCall(irBuilder, I);
                shadows.add(I, shadow);
                break;
#endif
            }
            //errs() << "111\n";
            // shadow instruction, substituting all operands with shadow operands
            Instruction* shadow = I->clone();
            shadowInstOperands(I, shadow);
            //errs() << "222\n";
            if (LoadInst* load = dyn_cast<LoadInst>(shadow)) {
                // make load volatile so not to be optimized away
                load->setVolatile(true);
            }
            //errs() << "333\n";
            shadows.add(I, shadow);
            irBuilder.Insert(shadow, I->getName() + CLONE_SUFFIX);
        }
            break;
            
        case Instruction::PHI: {
            // shadow PHI instruction, but delay shadowing its operands after
            // all function modifications (because PHI uses Value before it's
            // declared and thus shadowed)
            PHINode* shadow = cast<PHINode>( I->clone() );
            shadows.add(I, shadow);
            irBuilder.Insert(shadow, I->getName() + CLONE_SUFFIX);
            phis.push_back(shadow);
        }
            break;
            
            /* allocators, function calls */
        case Instruction::Alloca:
        case Instruction::Call:
        case Instruction::VAArg:
        case Instruction::AtomicCmpXchg:	// we treat cmpxchg as a load-store instruction
        case Instruction::AtomicRMW:        // we treat atomicrmw as a load-store instruction
        {
            if (CallInst* call = dyn_cast<CallInst>(I)) {
                // treat duplicated (llvm-intrinsic) functions as normal instructions
                if (swiftHelpers->isDuplicatedFunc(call->getCalledFunction())) {
                    Instruction* shadow = I->clone();
                    shadowInstOperands(I, shadow);
                    shadows.add(I, shadow);
                    irBuilder.Insert(shadow, I->getName() + CLONE_SUFFIX);
                    break;
                }
                
                // do not shadow calls to "ignored" functions
                if (swiftHelpers->isIgnoredFunc(call->getCalledFunction()))
                    break;
            }
            
            // make a shadow for allocated/returned value using swift-move
            Instruction *shadow = createMoveCall(irBuilder, I);
            shadows.add(I, shadow);
        }
            break;
            
        case Instruction::Invoke:
            //errs() << "Invoke\n";
            if (InvokeInst* inv = dyn_cast<InvokeInst>(I)) {
                //Check if called function is not void
                if(inv->getType() && inv->getType()->getTypeID()!=0){
                    //ges normal destination BB and initialises a IR Builder for it
                    //to insert the swift move related to its invoke right at its begining
                    BasicBlock* normDestBB=inv->getNormalDest();
                    IRBuilder<> irBuilder4normDBB(normDestBB, normDestBB->getFirstInsertionPt());
                    //invokeShadows.add(I, irBuilder4normDBB);
                    Instruction *shadow = createMoveCall(irBuilder4normDBB, I, true);
                    shadows.add(I, shadow);
                    break;
                }else{
                    errs() << "Invoke with void type\n";
                }
                
            }
            break;
        case Instruction::LandingPad:
        case Instruction::Resume:
            /* TODO: handle these instructions */
            break;
            
        default:
            errs() << "unknown instruction " << *I << "\n";
            assert(!"cannot handle unknown instruction");
            break;
    }
}

//Checkes if given instruction against its shadow
void SwiftTransformer::checkInst(Instruction* I) {
    BasicBlock::iterator instIt(I);
    
    switch (I->getOpcode()) {
        case Instruction::AtomicCmpXchg:	// we treat cmpxchg as a load-store instruction
        case Instruction::AtomicRMW:        // we treat atomicrmw as a load-store instruction
        case Instruction::Call:
        case Instruction::Ret:
        case Instruction::Switch:
        case Instruction::Invoke:
        {
            if (CallInst* call = dyn_cast<CallInst>(I)) {
                // do not do anything with duplicated (llvm-intrinsic) functions
                if (swiftHelpers->isDuplicatedFunc(call->getCalledFunction()))
                    break;
                // do not check calls to "ignored" functions
                if (swiftHelpers->isIgnoredFunc(call->getCalledFunction()))
                    break;
            }
            
            IRBuilder<> irBuilder(instIt->getParent(), instIt);
            checkInstOperands(I, irBuilder);
            
        }
            break;
        case Instruction::Br: {
            BranchInst *BI = cast<BranchInst>(I);
            if (BI->isUnconditional())
                break;
            
            // delay adding control-flow checks on conditional branches
            brs.push_back(BI);
        }
            break;
            
        case Instruction::Load: {
            LoadInst *LI = cast<LoadInst>(I);
#ifdef SWIFT_OPTIMIZE_SHARED_MEMORY_ACCESSES
            if (LI->isAtomic()) {
                // atomic loads work on shared non-locked data, we must not
                // load twice; that is why we check (address) operand here
                IRBuilder<> irBuilder(instIt->getParent(), instIt);
                checkInstOperands(I, irBuilder);
            }
#else
            // conservatively check operands on each load
            IRBuilder<> irBuilder(instIt->getParent(), instIt);
            checkInstOperands(I, irBuilder);
#endif
        }
            break;
            
        case Instruction::Store: {
            StoreInst *SI = cast<StoreInst>(I);
            
#ifdef SWIFT_OPTIMIZE_SHARED_MEMORY_ACCESSES
            if (isa<GlobalVariable>(SI->getPointerOperand())) {
                // optimization: if store global variable, we know that
                // address is constant and no need to load after store
                // NOTE: this optimization is also ad-hoc solution to
                //       race conditions on synchronization flags --
                //       they are usually declared as globals
                //       (see also code for Instruction::Load)
                IRBuilder<> irBuilder(instIt->getParent(), instIt);
                checkInstOperands(I, irBuilder);
                break;
            }
            
            if (SI->isAtomic()) {
                // atomic stores work on shared non-locked data, we must not
                // load after store, otherwise can see inconsistent copies;
                // so we check operands before store
                IRBuilder<> irBuilder(instIt->getParent(), instIt);
                checkInstOperands(I, irBuilder);
                break;
            }
            
            // add check instruction(s) after I
            IRBuilder<> irBuilder(instIt->getParent(), std::next(instIt));
            
            // get a shadow value for this store
            Value *val = SI->getValueOperand();
            Value *shadowval = shadows.getShadow(val, SI);
            if (!shadowval) {
                // no meaningful shadow value, nothing to check against
                break;
            }
            
            // get shadow address (or reuse master address) to load a freshly stored value
            Value *ptr = SI->getPointerOperand();
            Value *shadowptr = shadows.getShadow(ptr, SI);
            if (!shadowptr)	shadowptr = ptr;
            
            // alignment
            unsigned align = SI->getAlignment();
            
            LoadInst *loadedval = irBuilder.CreateLoad(shadowptr, true, "swift.loadtocheckstore"); // volatile load
            loadedval->setAlignment(align);
            
            // compare freshly stored value (reloaded for comparison) and shadow value
            createCheckerCall(irBuilder, loadedval, shadowval, false);
            
#else
            // conservatively check all stores' operands
            IRBuilder<> irBuilder(instIt->getParent(), instIt);
            checkInstOperands(I, irBuilder);
#endif
        }
            break;
            
        default:
            break;
    }
}


void SwiftTransformer::shadowArgs(Function& F, Instruction* firstI) {
    // add shadow args' definitions before firstI
    BasicBlock::iterator instIt(firstI);
    IRBuilder<> irBuilder(instIt->getParent(), instIt);
    
    // make a shadow for each function arg (using swift-move)
    for (auto arg = F.arg_begin(); arg != F.arg_end(); ++arg){
        Value *shadow = createMoveCall(irBuilder, &*arg);
        shadows.add(&*arg, shadow);
        errs() <<  "Shadowing" << *firstI << "\n";
        errs() <<  *shadow << "\n";
    }
}

void SwiftTransformer::rewireShadowPhis() {
    // substitute all incoming values in all collected phis with shadows
    for (auto phiIt = phis.begin(); phiIt != phis.end(); ++phiIt) {
        PHINode* phi = *phiIt;
        for (unsigned i = 0; i < phi->getNumIncomingValues(); ++i){
            // check if any previous operand of PHI has the same incoming BB;
            // this happens when incoming BB has a switch statement
            bool sameIncomingValue = false;
            BasicBlock *IncomingBB = phi->getIncomingBlock(i);
            for (unsigned j = 0; j < i; ++j) {
                if (phi->getIncomingBlock(j) == IncomingBB) {
                    Value *IncomingVal = phi->getIncomingValue(j);
                    phi->setIncomingValue(i, IncomingVal);
                    sameIncomingValue = true;
                }
            }
            if (sameIncomingValue) continue;
            
            Value *v = phi->getIncomingValue(i);
            Value *shadow = shadows.getShadow(v, phi);
            if (shadow)
                phi->setIncomingValue(i, shadow);
            else if (ConstantInt *c = dyn_cast<ConstantInt>(v)) {
                // if incoming value is a constant, this PHI is most likely
                // an induction var in loop, and codegen optimizes it away;
                // to prevent it, we use a hack:
                //   - create a global constant variable set to constant
                //   - insert a load of this global in PHI's incoming block
                //   - replace incoming value-constant with load's result
                if (c->getBitWidth() > 64)
                    continue;
                
                // create a global constant variable set to constant
                GlobalVariable* gv = nullptr;
                std::pair<Type*, uint64_t> keypair = std::make_pair(c->getType(), c->getValue().getLimitedValue());
                GlobalConstMap::iterator it = globalconsts.find(keypair);
                if (it == globalconsts.end()) {
                    // need to create GlobalVariable
                    static int cnt = 0;
                    gv = new GlobalVariable(*swiftHelpers->module,
                                            c->getType(),
                                            true, // constant
                                            GlobalValue::InternalLinkage,
                                            c,	  // ConstantInt
                                            "SWIFT$global" + std::to_string(cnt++));
                    globalconsts.insert(std::make_pair(keypair, gv));
                } else {
                    // reuse already existing GlobalVariable
                    gv = it->second;
                }
                assert(gv && "could not create/find global variable for PHI node");
                
                // insert a load of global var in PHI's incoming block
                IRBuilder<> irBuilder(phi->getIncomingBlock(i)->getTerminator());
                Value* loaded = irBuilder.CreateLoad(gv, true); // volatile load
                // replace incoming value-constant with load's result
                phi->setIncomingValue(i, loaded);
            }
        }
    }
}

// detect if V already requires check inside loop L:
// transitively follow all uses of V that are still inside loop L
// and if at least one of these uses requires a check, return true
bool SwiftTransformer::requiresCheckTransitive(Loop* L, Value* V) {
    //		errs() << "requiresCheckTransitive: Loop " << L << " Value " << *V << "\n";
    for (User *U : V->users()) {
        if (!isa<Instruction>(U))
            continue;
        Instruction* I = cast<Instruction>(U);
        
        if (!L->contains(I))
            continue;
        
        if (isa<PHINode>(I) && I->getParent() == L->getHeader()) {
            // to break cycle dep, stop on the loop header's phi nodes
            continue;
        }
        
        if (isa<StoreInst>(I) || isa<BranchInst>(I) ||
            isa<AtomicCmpXchgInst>(I) || isa<AtomicRMWInst>(I) ||
            isa<ReturnInst>(I) || isa<SwitchInst>(I))
            return true;
        
        if (LoadInst* load = dyn_cast<LoadInst>(I))
            if (load->isAtomic())
                return true;
        
        if (CallInst* call = dyn_cast<CallInst>(I)) {
            if (!swiftHelpers->isDuplicatedFunc(call->getCalledFunction()) &&
                !swiftHelpers->isIgnoredFunc(call->getCalledFunction()))
                return true;
        }
        
        if (requiresCheckTransitive(L, I))
            return true;
    }
    return false;
}

void SwiftTransformer::insertChecksOnLoopHeader(Loop* L, DominatorTree* DT) {
    for (auto li = L->begin(), le = L->end(); li != le; ++li) {
        insertChecksOnLoopHeader(*li, DT);
    }
    
    if (!L->empty()) {
        // we are only interested in most-inner loops
        return;
    }
    
    std::vector<PHINode*> phiesToCheck;
    BasicBlock* header = L->getHeader();
    for (BasicBlock::iterator I = header->begin(); I != header->end(); I++) {
        if (!isa<PHINode>(I)) {
            // if instr is not phi, then we know this header has no more phis
            break;
        }
        
        PHINode* phi = cast<PHINode>(I);
        if (!shadows.hasShadow(phi)) {
            // this is already a shadow phi, ignore
            continue;
        }
        
        // we located original phi, examine its transitive def-use chain:
        // if it is used in some loop instr that requires a check, then
        // this phi is assumed to be already checked inside the loop,
        // if there are no such instrs, this phi must be explicitly checked
        if (!requiresCheckTransitive(L, phi))
            phiesToCheck.push_back(phi);
    }
    
    if (!phiesToCheck.empty()) {
        // insert BB with explicit checks for selected phis,
        // this BB will be subsequently transformed by Trans and
        // executed before conditional Tx-end
        ConstantInt* CondZero = ConstantInt::get(Type::getInt1Ty(getGlobalContext()), 0);
        TerminatorInst* CheckTerm = SplitBlockAndInsertIfThen(CondZero, header->getFirstNonPHI(), false, nullptr, DT);
        
        IRBuilder<> irBuilder(CheckTerm);
        for (auto phiIt = phiesToCheck.begin(); phiIt != phiesToCheck.end(); ++phiIt) {
            PHINode* phi = *phiIt;
            Value *shadowphi = shadows.getShadow(phi, phi);
            createCheckerCall(irBuilder, phi, shadowphi, false);
        }
    }
}

void SwiftTransformer::insertChecksOnLoopHeaders(LoopInfo &LI, DominatorTree* DT) {
#ifdef SWIFT_INSERT_CHECKS_ON_LOOP_HEADERS
    for (auto li = LI.begin(), le = LI.end(); li != le; ++li) {
        insertChecksOnLoopHeader(*li, DT);
    }
#endif
}



void SwiftTransformer::addShadowBasicBlocks(BranchInst* BI) {
    if (CmpInst *cmp1 = dyn_cast<CmpInst>(BI->getCondition())) {
        CmpInst *cmp2 = dyn_cast<CmpInst>( shadows.getShadow(cmp1, BI) );
        if (!cmp2) return;
        // --- create Detected BB once for each function ---
        if (!detectedBB) {
            LLVMContext &C = BI->getContext();
            detectedBB = BasicBlock::Create(C, "Detected", BI->getParent()->getParent());
            IRBuilder<> irBuilder(detectedBB);
            ArrayRef<Value*> args;
            irBuilder.CreateCall(swiftHelpers->detectedfunc, args);
            irBuilder.CreateUnreachable();
        }
        for (unsigned succidx = 0; succidx < BI->getNumSuccessors(); succidx++) {
            BasicBlock *SuccBB = BI->getSuccessor(succidx);
            
            CmpInst* succcmp2 = cast<CmpInst>(cmp2->clone());
            if (succidx == 0)	// True block
                succcmp2->setPredicate(succcmp2->getInversePredicate());
            
            // create shadow BB
            LLVMContext &C = SuccBB->getContext();
            BasicBlock *SuccBBShadow = BasicBlock::Create(C, "BBShadow", SuccBB->getParent(), SuccBB);
            
            // fill shadow BB with comparison and br to "detected"
            IRBuilder<> irBuilder(SuccBBShadow);
            irBuilder.Insert(succcmp2);
            
            // rewire Branch -> shadow BB -> true BB
            irBuilder.CreateCondBr(succcmp2, detectedBB, SuccBB);
            BI->setSuccessor(succidx, SuccBBShadow);
            
            // update Phis in succ BB to set shadow-BB as incoming block
            for (BasicBlock::iterator I = SuccBB->begin(); isa<PHINode>(I); ) {
                PHINode *PI = cast<PHINode>(I++);
                for (unsigned i = 0; i < PI->getNumIncomingValues(); ++i){
                    BasicBlock *IncomingBB = PI->getIncomingBlock(i);
                    if (IncomingBB == BI->getParent())
                        PI->setIncomingBlock(i, SuccBBShadow);
                }
            }
        }
        
        // Note that the original shadow-comparison becomes redundant
        // and will be optimized away, so we don't remove it explicitly
    }
}



void SwiftTransformer::addControlFlowChecks() {
    
    for (auto brIt = brs.begin(); brIt != brs.end(); ++brIt) {
        
        BranchInst* BI = *brIt;
#ifdef SWIFT_SIMPLE_CONTROL_FLOW
        // insert additional shadow BBs to protect against status
        // register corruption ??
        
        errs() << *BI << "\n";
        addShadowBasicBlocks(BI);
        
#else
        // fallback to simple & slow strategy: check branch condition
        IRBuilder<> irBuilder(BI->getParent(), BI);
        Value *val1 = BI->getCondition();
        Value *val2 = shadows.getShadow(val1, BI);
        if (val2)  createCheckerCall(irBuilder, val1, val2, false);
#endif
    }
    
}


SwiftTransformer::SwiftTransformer(SwiftHelpers* inSwiftHelpers) {
    swiftHelpers = inSwiftHelpers;
}
