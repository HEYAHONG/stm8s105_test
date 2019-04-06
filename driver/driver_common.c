#include "driver_common.h"
void driver_init()
{
 CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//设置为内部高速时钟
 key_init();
 beep_init();
 extend_board_init();
//Initialize UART
 Init_UART2();
 UART2_Init_Send();
 OLED_Init();
 OLED_Clear();
//ds1302_active();
 Tim2_Init();
 enableInterrupts();
 WitchDog_init();
}
// 实时时间
DS1302_TIME  ds_time;
//实时温湿度
DHT12_DATA dh_data;
//读取dht12需要2~3s间隔，否则可能不正确
//static u8 last_read_dh_time;
//ADC 采集值( YL-69的模拟输出和数字输出)
ADC_DATA adc_data;
void driver_loop()
{
WitchDog_reset();
if(ds_1302_timer>eeprom_read(5)*100)
{
ds_1302_timer=0;
ds1302_read_time(&ds_time);
}
//间隔2～3秒读取一次
//if(ds_time.second/3 != last_read_dh_time/3)
if(dht12_timer>eeprom_read(6)*1000)
{
dht12_timer=0;
ReadDHT12(&dh_data);
//last_read_dh_time=ds_time.second;
}

if(adc_timer>eeprom_read(7)*1000)//
{
//读取ADC
adc_timer=0;
adc_data.Ain=ReadADC();
adc_data.Din=ReadDin();
}
if(extend_channel_timer>eeprom_read(10)*1000)//切换扩展板通道
{
extend_channel_timer=0;
extend_board_channel_change();
}
}
