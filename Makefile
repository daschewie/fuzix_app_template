include $(FUZIX_ROOT)/Target/rules.$(USERCPU)

SRCS  = hello.c

OBJS = $(SRCS:.c=.o)

EXE = hello

all: $(EXE)

$(EXE): $(OBJS)
	$(LINKER) $(CRT0) $^ -o $@ $(LINKER_OPT) $(LINKER_TAIL)

# Example using libs
# $(EXE): %: %.o
#	$(LINKER) $(CRT0) $^ -o $@ $(LINKER_OPT) -lcurses$(USERCPU) -ltermcap$(USERCPU) $(LINKER_TAIL)

clean:
	rm -f $(OBJS) 
	rm -f $(EXE)
	rm -f $(SRCS:.c=) core *~ *.asm *.lst *.sym *.map *.noi *.lk *.ihx *.tmp *.bin *.o

