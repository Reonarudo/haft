ILR_PASSNAME = ilr
RUST_COMPILER = rustc
RUST_COMPILER_OPT = -g -C opt-level=3 --emit=llvm-bc

LLVM_OPT=$(LLVM_PATH)opt

all:$(patsubst %.rs, %.ilr.bc, $(wildcard *.rs))
	$(LLVM_OPT) -load $(PASSFILE) $(PASSNAME) $(NAME).bc -o $(NAME).afterMyPass.bc
	$(RUST_COMPILER) -o % %.ilr.bc
%.ilr.bc:%.rs ;@echo Building $@ to .bc
	$(RUST_COMPILER) $(RUST_COMPILER_OPT) $< -o $@