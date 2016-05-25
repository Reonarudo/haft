NAME = mandelbrot

ILR_PASSFILE = ../../../ilr/pass/ilr_pass.so
ILR_PASSNAME = ilr

RUST_COMPILER = rustc
RUST_COMPILER_OPT = -g -C opt-level=3
RUST_LLVM_BC = --emit=llvm-bc
RUST_LIB_PATH = /usr/local/lib/rustlib/x86_64-apple-darwin/lib

CLANG=$(LLVM_PATH)clang++
LLVM_OPT=$(LLVM_PATH)opt
LLVM_STATIC_COMPILER = $(LLVM_PATH)llc

OUT_FILE = out.txt

all: $(OUT_FILE)
	
$(OUT_FILE): $(NAME).norm $(NAME).ilr ;@echo Starting Mandelbrot benchmark
	@echo Normal execution time: >> $@
	@time ./$(NAME).norm 16000 >> $@
	@echo ILR execution time: >> $@
	@time ./$(NAME).ilr 16000 >> $@

#Building normal executable	
$(NAME).norm:$(NAME).rs
	@$(RUST_COMPILER) $(RUST_COMPILER_OPT) $< -o $@

#Building ILR modified executable
$(NAME).ilr: $(NAME).ilr.bc
	#Linking the Rust standart libraries and producing an executable
	@$(CLANG) -L$(RUST_LIB_PATH) -lstd-4fda350b -o $@ $@.bc

#Aplying ILR pass to .bc
$(NAME).ilr.bc:$(NAME).bc
	@$(LLVM_OPT) -load $(ILR_PASSFILE) -run-pass=$(ILR_PASSNAME) $(NAME).bc -o $@

#Compile source to bitcode	
$(NAME).bc:	$(NAME).rs
	@$(RUST_COMPILER) $(RUST_COMPILER_OPT) $(RUST_LLVM_BC) $< -o $@
	
	
clean:
	rm -f $(NAME).ilr
	rm -f $(NAME).bc
	rm -f $(NAME).norm
	rm -f $(NAME).ilr.o
	rm -f $(NAME).ilr.bc
	rm -f $(OUT_FILE)