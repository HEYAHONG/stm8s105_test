#include "driver_common.h"
void driver_init()
{
 key_init();
 beep_init();
//Initialize UART
 Init_UART2();
 OLED_Init();
 OLED_Clear();
ds1302_active();
 enableInterrupts(); 
}
// 实时时间
DS1302_TIME  ds_time;
//实时温湿度
DHT12_DATA dh_data;
//读取dht12需要2~3s间隔，否则可能不正确
static u8 last_read_dh_time;
//ADC 采集值( YL-69的模拟输出和数字输出)
ADC_DATA adc_data;
void driver_loop()
{
ds1302_read_time(&ds_time);

//间隔2～3秒读取一次
if(ds_time.second/3 != last_read_dh_time/3)
{
ReadDHT12(&dh_data);
last_read_dh_time=ds_time.second;
}

//读取ADC
adc_data.Ain=ReadADC();
adc_data.Din=ReadDin();
}
