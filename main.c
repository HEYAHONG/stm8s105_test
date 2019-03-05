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
WitchDog_reset();
app_init();
WitchDog_reset();
while(1)
{
driver_loop();
WitchDog_reset();
app_loop();
WitchDog_reset();
//Delay(0x8fff);
}
}
