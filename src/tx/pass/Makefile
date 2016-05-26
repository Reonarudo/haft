SOURCES = tx.cpp
LIB_NAME = tx_pass.so

include ../../Makefile.local

OBJ = $(addsuffix .o, $(basename ${SOURCES}))

LDFLAGS = $(shell $(LLVM_PATH)llvm-config --ldflags)
LDFLAGS +=-Wl,-dead_strip -Wl,-flat_namespace -Wl,-undefined -Wl,suppress
CXXFLAGS = -g -Wall -fno-rtti -fPIC -std=c++11 $(shell $(LLVM_PATH)llvm-config --cxxflags --system-libs)
COMPILER = clang++

all: $(LIB_NAME)

$(LIB_NAME): $(OBJ)
	$(COMPILER) $(CXXFLAGS) -bundle $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o *~
	rm -f $(LIB_NAME)

