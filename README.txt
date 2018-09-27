使用新的库需要把库对应的.c文件编译，已经编译的有stm8s_gpio.c，stm8s_uart1.c，stm8s_clk.c，没有使用的最好就不要编译，否则可能导致flash空间不够用（也是为啥没在Makefile把所有库文件写进去的原因）。
