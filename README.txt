测试用SDCC版本:SDCC : mcs51/z80/z180/r2k/r3ka/gbz80/tlcs90/ds390/pic16/pic14/TININative/ds400/hc08/s08/stm8 3.8.0 #10557 (MINGW32)

使用新的库需要把库对应的.c文件编译，已经编译的有stm8s_gpio.c，stm8s_uart1.c，stm8s_clk.c，没有使用的最好就不要编译，否则可能导致flash空间不够用（也是为啥没在Makefile把所有库文件写进去的原因）。
