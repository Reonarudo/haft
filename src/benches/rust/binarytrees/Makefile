ILR_PASSFILE = ../../../ilr/pass/ilr_pass.so
ILR_PASSNAME = ilr
RUST_COMPILER = rustc
RUST_COMPILER_OPT = -g -C opt-level=3
RUST_LLVM_BC = --emit=llvm-bc
NAME =binarytrees

LLVM_OPT=$(LLVM_PATH)opt
LLVM_STATIC_COMPILER = $(LLVM_PATH)llc

all:$(NAME).ilr;@echo Starting Mandelbrot benchmark
$(NAME).ilr:$(NAME).rs ;@echo Building $@ to .bc
	$(RUST_COMPILER) $(RUST_COMPILER_OPT) $(RUST_LLVM_BC) $< -o $@.bc
	$(RUST_COMPILER) $(RUST_COMPILER_OPT) $< -o $(patsubst %.ilr, %.norm, $@)
	$(LLVM_OPT) -load $(ILR_PASSFILE) -run-pass=$(ILR_PASSNAME) $@.bc -o $@.bc
	$(LLVM_STATIC_COMPILER) -o=$@ $@.bc
	echo Normal execution time:
	time ./$(NAME).norm 16000
	echo ILR execution time:
	time ./$(NAME).ilr 16000
	
clean:
	rm -f $(NAME).ilr
	rm -f $(NAME).norm
	rm -f $(NAME).ilr.o
	rm -f $(NAME).ilr.bc