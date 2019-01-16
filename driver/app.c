#include "app.h"
#include "driver_common.h"
#include "stdio.h"
void app_init()
{
beep_off();
relay_off();
OLED_Clear();
//启动显示界面并设置为主菜单
eeprom_write(1,0);
eeprom_write(2,0);
eeprom_write(3,0);

}
void app_loop()
{
u16 status=eeprom_read(2)*256+eeprom_read(3);
    if(keycount[0]||keycount[1]||keycount[2]||keycount[3]||keycount[4]) //按键处理
    {
      OLED_Clear();
    if(keycount[0])//浇水按键
        {
        relay_read()?relay_off():relay_on();
        keycount[0]=0;
        }

    if(keycount[1]) //上一级菜单
        {
        if(status&0xff) {status=status&0xff00;eeprom_write(3,0);}
        else {status=0;eeprom_write(2,0);}
        keycount[1]=0;
        }
    if(keycount[2])//下一级菜单,第三级界面地址加
        {
        if(status&0xff00) {
                            if((status&0xff)==0||(status&0xff)==32)//第三级界面地址在1～32之间
                            {
                            status=(status&0xff00)|0x01;
                            eeprom_write(3,1);
                            } else
                            {
                            status=status+1;
                            eeprom_write(3,status&0xff);
                            }
                            }
        else {status=status|0x0100;eeprom_write(2,1);}
        keycount[2]=0;
        }
    if(keycount[3]) //数值加
        {
        if(status&0xff)//加数值
        {
        eeprom_write((status>>8)*32+status&0xff-1,eeprom_read((status>>8)*32+status&0xff-1)+1);
        }
        else if(status&0xff00) //加规则引索
        {
        if((status&0xff00)==0x1000)//共16条规则
        {
        status=0x0100;
        eeprom_write(2,1);
        }
        else
        {
        status+=0x0100;
        eeprom_write(2,status>>8);
        }
        }
        keycount[3]=0;
        }
        if(keycount[4]) //数值减
        {
        if(status&0xff)//减数值
        {
        eeprom_write((status>>8)*32+(status&0xff)-1,eeprom_read((status>>8)*32+(status&0xff)-1)-1);
        }
        else if(status&0xff00) //减规则引索
        {
        if((status&0xff00)==0x0100)//共16条规则
        {
        status=0x1000;
        eeprom_write(2,0x10);
        }
        else
        {
        status-=0x0100;
        eeprom_write(2,status>>8);
        }
        }
        keycount[4]=0;
        }
    }


    if(!eeprom_read(1))//界面显示
    {
        static unsigned char temp[4][16],i;
        for(i=0;i<4;i++)//初始化temp
        {
        sprintf(temp[i],"");
        }
        sprintf(temp[0],"%2d:%2d:%2d Add:%3d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16,eeprom_read(0));
        sprintf(temp[1],"%2d.%1dC/%2d.%1d%%/%4d",dh_data.T,dh_data.T1&0x0f,dh_data.W,dh_data.W1&0x0f,adc_data.Ain);
        sprintf(temp[2],"B:%s,R:%s",beep_read()?"on":"off",relay_read()?"on":"off");
    if(status==0)//主菜单
    {
       // unsigned char temp[4][16],i;
       // for(i=0;i<4;i++)//初始化temp
       // {
       // sprintf(temp[i],"");
       // }
       // sprintf(temp[0],"%2d:%2d:%2d Add:%3d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16,eeprom_read(0));
       // sprintf(temp[1],"%2d.%1dC/%2d.%1d%%/%4d",dh_data.T,dh_data.T1&0x0f,dh_data.W,dh_data.W1&0x0f,adc_data.Ain);
       // sprintf(temp[2],"B:%s,R:%s",beep_read()?"on":"off",relay_read()?"on":"off");
        for(i=0;i<4;i++)//输出显示
        {
        OLED_ShowString(0,i*2,temp[i]);
        }
    }
    else if((status&0xff)==0)//规则选择菜单
    {
        //unsigned char temp[4][16],i;
        //for(i=0;i<4;i++)//初始化temp
       // {
       // sprintf(temp[i],"");
        //}
        //sprintf(temp[0],"%2d:%2d:%2d Add:%3d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16,eeprom_read(0));
       // sprintf(temp[1],"%2d.%1dC/%2d.%1d%%/%4d",dh_data.T,dh_data.T1&0x0f,dh_data.W,dh_data.W1&0x0f,adc_data.Ain);
       // sprintf(temp[2],"B:%s,R:%s",beep_read()?"on":"off",relay_read()?"on":"off");
        sprintf(temp[3],"rule:%2d",(0xff00&status)>>8);
        for(i=0;i<4;i++)//输出显示
        {
        OLED_ShowString(0,i*2,temp[i]);
        }

    }
    else //规则编辑菜单
    {
        //unsigned char temp[4][16],i;
        //for(i=0;i<4;i++)//初始化temp
       // {
       // sprintf(temp[i],"");
        //}
       // sprintf(temp[0],"%2d:%2d:%2d Add:%3d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16,eeprom_read(0));
       // sprintf(temp[1],"%2d.%1dC/%2d.%1d%%/%4d",dh_data.T,dh_data.T1&0x0f,dh_data.W,dh_data.W1&0x0f,adc_data.Ain);
       // sprintf(temp[2],"B:%s,R:%s",beep_read()?"on":"off",relay_read()?"on":"off");
        sprintf(temp[3],"Addr:%2d,Val:%d",(status&0xff)-1,eeprom_read(((status&0xff00)>>8)*32+status&0xff-1));
        for(i=0;i<4;i++)//输出显示
        {
        OLED_ShowString(0,i*2,temp[i]);
        }
    }
    }
    else // 关闭显示
        OLED_Clear();


}
