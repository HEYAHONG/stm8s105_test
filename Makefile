ifndef PROJECT
PROJECT=test
endif
ifndef WIN32
SUDO=sudo
endif
SDCC=sdcc
PACKIHX=packihx
MAKEBIN=makebin
STM8FLASH=stm8flash
SDAS=sdasstm8

#select stm8s103
CFLAGS+=  -DSTM8S105 -mstm8  -DUSE_STDPERIPH_DRIVER

#use std_periph_driver
CFLAGS+= -I./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/inc
CFLAGS+= -I./
CFLAGS+= -I./driver
CFLAGS+= -I./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src
#use compiled lib
#CFLAGS+= -L./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/lib -lSTM8S103.lib -lstm8.lib
#not use compiled lib
#CFLAGS+=-lstm8.lib

SRC=$(wildcard *.c) $(wildcard ./driver/*.c)  ./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c ./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c  ./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c  ./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c    ./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c  ./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c   ./STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c

OBJ1_SRC=$(patsubst %.c,%.rel,$(SRC))
OBJ_SRC=$(patsubst %.asm,%.rel,$(OBJ1_SRC))

ASM_DST=$(patsubst %.rel,%.asm,$(OBJ_SRC))
LST_DST=$(patsubst %.rel,%.lst,$(OBJ_SRC))
RST_DST=$(patsubst %.rel,%.rst,$(OBJ_SRC))
SYM_DST=$(patsubst %.rel,%.sym,$(OBJ_SRC))



all: $(PROJECT).hex



$(PROJECT).hex:$(PROJECT).ihx
	$(PACKIHX) $^ > $@


$(PROJECT).ihx:$(OBJ_SRC)
	$(SDCC) $(CFLAGS)  $^ -o $(PROJECT).ihx
	 -rm -rf $(OBJ_SRC) $(ASM_DST) $(LST_DST) $(RST_DST) $(SYM_DST)

%.rel:%.c
	$(SDCC) -c $(CFLAGS) $^ -o $@
%.rel:%.asm
	$(SDAS)  $^ -o $@

flash:$(PROJECT).hex
	$(SUDO) $(STM8FLASH) -c stlinkv2 -p stm8s105k6 -w $(PROJECT).hex
clean:
	-rm -rf $(OBJ_SRC) $(ASM_DST) $(LST_DST) $(RST_DST) $(SYM_DST)
	-rm -rf $(PROJECT).ihx $(PROJECT).hex $(PROJECT).lk $(PROJECT).mem  $(PROJECT).map $(PROJECT).cdb
