NAME = mandelbrot

ILR_PATH = ../../../ilr
ILR_RUNTIME = $(ILR_PATH)/runtime/ilr.ll.checks-exit_rust
ILR_PASSFILE = $(ILR_PATH)/pass/ilr_pass.so
ILR_PASSNAME = ilr

TX_PASSFILE = ../../../tx/pass/tx_pass.so
TX_PASSNAME = tx

RUST_COMPILER = rustc
RUST_COMPILER_OPT = -C opt-level=3
RUST_NO_LANDINGPAD = -Z no-landing-pads
RUST_LLVM_BC = --emit=llvm-bc
RUST_LIB_PATH = /usr/local/lib/rustlib/x86_64-apple-darwin/lib

CLANG=$(LLVM_PATH)clang++
LLVM_OPT=$(LLVM_PATH)opt
LLVM_STATIC_COMPILER = $(LLVM_PATH)llc
LLVM_LINK = $(LLVM_PATH)llvm-link

OUT_FILE = out.txt
 
all: $(OUT_FILE)
	
$(OUT_FILE): $(NAME).norm $(NAME).ilr $(NAME).tx $(NAME).haft;@echo Starting Mandelbrot benchmark
	@echo Normal execution time: >> $@
	@ (time ./$(NAME).norm 16000) >/dev/null 2>> $@
	@echo ILR execution time: >> $@
	@ (time ./$(NAME).ilr 16000) >/dev/null 2>> $@
	@echo TX execution time: >> $@
	@ (time ./$(NAME).tx 16000) >/dev/null 2>> $@
	@echo HAFT execution time: >> $@
	@ (time ./$(NAME).haft 16000) >/dev/null 2>> $@

#Building normal executable	
$(NAME).norm:$(NAME).rs
	@$(RUST_COMPILER) $(RUST_NO_LANDINGPAD) $(RUST_COMPILER_OPT) $< -o $@
	
#Building HAFT modified executable
$(NAME).haft: $(NAME).ilr.tx.bc
	#Linking the Rust standart libraries and producing an executable
	@$(CLANG) -L$(RUST_LIB_PATH) -lstd-4fda350b -o $@ $<

#Aplying TX pass to ilr.bc
$(NAME).ilr.tx.bc: $(NAME).ilr.bc
	@$(LLVM_OPT) -load $(TX_PASSFILE) -run-pass=$(TX_PASSNAME) $< -o $@

#Building ILR only modified executable
$(NAME).ilr: $(NAME).ilr.bc
	#Linking the Rust standart libraries and producing an executable
	@$(CLANG) -L$(RUST_LIB_PATH) -lstd-4fda350b -o $@ $@.bc

#Building TX only modified executable
$(NAME).tx: $(NAME).tx.bc
	#Linking the Rust standart libraries and producing an executable
	@$(CLANG) -L$(RUST_LIB_PATH) -lstd-4fda350b -o $@ $@.bc

#Linking ILR bc with runtime
$(NAME).rt.bc:$(NAME).bc $(ILR_RUNTIME)
	@$(LLVM_LINK) -o $@ $^

#Aplying ILR pass to original .bc
$(NAME).ilr.bc:$(NAME).rt.bc
	@$(LLVM_OPT) -load $(ILR_PASSFILE) -$(ILR_PASSNAME) $< -o $@
	
#Aplying TX pass to original .bc
$(NAME).tx.bc:$(NAME).bc
	@$(LLVM_OPT) -load $(TX_PASSFILE) -$(TX_PASSNAME) $< -o $@

#Compile source to bitcode	
$(NAME).bc:	$(NAME).rs
	@$(RUST_COMPILER) $(RUST_NO_LANDINGPAD) $(RUST_COMPILER_OPT) $(RUST_LLVM_BC) $< -o $@
	
	
clean:
	rm -f $(NAME).ilr
	rm -f $(NAME).tx
	rm -f $(NAME).haft
	rm -f $(NAME).bc
	rm -f $(NAME).norm
	rm -f $(NAME).ilr.o
	rm -f $(NAME).ilr.bc
	rm -f $(NAME).tx.o
	rm -f $(NAME).tx.bc
	rm -f $(NAME).ilr.tx.bc
	rm -f $(OUT_FILE)