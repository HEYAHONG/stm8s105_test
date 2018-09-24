ifndef PROJECT
PROJECT=test
endif

SDCC=sdcc
PACKIHX=packihx
MAKEBIN=makebin

#select stm8s103
CFLAGS+=  -DSTM8S103 -mstm8  -DUSE_STDPERIPH_DRIVER  

#use std_periph_driver
CFLAGS+= -I./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/inc 
CFLAGS+= -I./
CFLAGS+= -I./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src
#use compiled lib
CFLAGS+= -L./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/lib -lSTM8S103.lib -lstm8.lib


SRC=$(wildcard *.asm) $(wildcard *.c) 

OBJ1_SRC=$(patsubst %.c,%.rel,$(SRC))
OBJ_SRC=$(patsubst %.asm,%.rel,$(OBJ1_SRC))

ASM_DST=$(patsubst %.rel,%.asm,$(OBJ_SRC))
LST_DST=$(patsubst %.rel,%.lst,$(OBJ_SRC))
RST_DST=$(patsubst %.rel,%.rst,$(OBJ_SRC))
SYM_DST=$(patsubst %.rel,%.sym,$(OBJ_SRC))



all: $(PROJECT).hex 
	 -rm -rf $(OBJ_SRC) $(ASM_DST) $(LST_DST) $(RST_DST) $(SYM_DST)


$(PROJECT).hex:$(PROJECT).ihx
	$(PACKIHX) $^ > $@ 


$(PROJECT).ihx:$(OBJ_SRC)
	$(SDCC) $(CFLAGS)  $^ -o $(PROJECT).ihx

%.rel:%.c
	$(SDCC) -c $(CFLAGS) $^ -o $@
%.rel:%.asm
	$(SDCC) -c $(CFLAGS) $^ -o $@
clean:
	-rm -rf $(OBJ_SRC) $(ASM_DST) $(LST_DST) $(RST_DST) $(SYM_DST)
	-rm -rf $(PROJECT).ihx $(PROJECT).hex $(PROJECT).lk $(PROJECT).mem  $(PROJECT).map
