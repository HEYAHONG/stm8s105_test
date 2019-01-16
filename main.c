#include "stm8s.h"
#include "driver_common.h"
#include "app.h"

void Delay(u32 i)
{
while(i--);
}
int main()
{
driver_init();
app_init();
while(1)
{
driver_loop();
app_loop();
//Delay(0x8fff);
}
}
