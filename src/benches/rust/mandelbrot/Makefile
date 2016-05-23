ILR_PASSFILE = ../../../ilr/pass/ilr_pass.so
ILR_PASSNAME = ilr
RUST_COMPILER = rustc
RUST_COMPILER_OPT = -g -C opt-level=3
RUST_LLVM_BC = --emit=llvm-bc
NAME = mandelbrot

LLVM_OPT=$(LLVM_PATH)opt

all:$(NAME).ilr;@echo Starting Mandelbrot benchmark
$(NAME).ilr:$(NAME).rs ;@echo Building $@ to .bc
	$(RUST_COMPILER) $(RUST_COMPILER_OPT) $(RUST_LLVM_BC) $< -o $@.bc
	$(RUST_COMPILER) $(RUST_COMPILER_OPT) $< -o $(patsubst %.ilr, %.norm, $@)
	$(LLVM_OPT) -load $(ILR_PASSFILE) -run-pass=$(ILR_PASSNAME) $@.bc -o $@.bc
	$(RUST_COMPILER) -o $@ $@.bc
	echo Normal execution time:
	time ./$(patsubst %.ilr, %.norm, $@) 16000
	echo ILR execution time:
	time ./$@ 16000
	
clean:
	rm -f $(NAME).ilr
	rm -f $(NAME).norm
	rm -f $(NAME).ilr
	rm -f $(NAME).ilr.bc