CC=sdcc
AR=sdar
CFLAGS=-c -mstm8 -DSTM8S105 -DUSE_STDPERIPH_DRIVER -pstm8s105 --stack-auto --all-callee-saves  --allow-unsafe-read  -I../inc -I../src --opt-code-size -I.
LDFLAGS=-rc 
#SOURCES=$(wildcard stm*.c)

LIBSOURCES= \
stm8s_adc1.c \
stm8s_awu.c \
stm8s_beep.c \
stm8s_clk.c \
stm8s_exti.c \
stm8s_flash.c \
stm8s_gpio.c \
stm8s_i2c.c \
stm8s_itc.c \
stm8s_iwdg.c \
stm8s_rst.c \
stm8s_spi.c \
stm8s_tim1.c \
stm8s_tim2.c \
stm8s_tim4.c \
stm8s_wwdg.c \
stm8s_tim3.c \
stm8s_uart2.c \


OBJECTS=$(LIBSOURCES:.c=.o)
OBJECTS_LINK=$(LIBSOURCES:.c=.rel)
EXECUTABLE=stm8s105.lib

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(AR) $(LDFLAGS) $(EXECUTABLE) $(OBJECTS_LINK) 

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean: 
	rm -f *.lib *.rst *.rel *.lst *.ihx *.sym *.asm *.lk *.map
	rm -f $(EXECUTABLE)
