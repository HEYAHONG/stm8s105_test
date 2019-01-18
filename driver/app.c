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
    if(eeprom_read(4))//启用规则
    {
        static u8 adcH,adcL,h,m,s;//准备需要的数据
        adcH=adc_data.Ain>>8;
        adcL=adc_data.Ain&0xff;
        h=ds_time.hour/16*10+ds_time.hour%16;
        m=ds_time.minute/16*10+ds_time.minute%16;
        s=ds_time.second/16*10+ds_time.second%16;
        u8 i,beep_flag=0,relay_flag=0;//准备相应标志位
        for(i=0;i<16;i++)//共16条规则
            {
            u8 baseadd=32*(i+1);//规则偏移地址
            if(eeprom_read(baseadd))//当前规则已启用
                {
                    {//小时
                    u8 data=h,conbase=1;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                    {//分钟
                    u8 data=m,conbase=4;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                    {//秒
                    u8 data=s,conbase=7;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                    {//adcH
                    u8 data=adcH,conbase=10;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                     {//adcL
                    u8 data=adcL,conbase=13;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                    if(eeprom_read(baseadd+16)) //判断adc数字输入
                        {
                        if(!adc_data.Din) continue;
                        }
                     {//T
                    u8 data=dh_data.T,conbase=17;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                    {//T1
                    u8 data=dh_data.T1,conbase=20;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                    {//W
                    u8 data=dh_data.W,conbase=23;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }
                    {//W1
                    u8 data=dh_data.W1,conbase=26;//当前需要判断的数据，当前条件在规则中的偏移
                    if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
                        {
                        u8 flag=0;
                        if(data<eeprom_read(baseadd+conbase)) flag|=0x01;//置位0
                        if(eeprom_read(baseadd+conbase)<=data && data <=eeprom_read(baseadd+conbase+1)) flag|=0x02;//置位1
                        if(eeprom_read(baseadd+conbase+1)<data) flag|=0x04;
                        if(!(eeprom_read(baseadd+conbase+2)&flag)) continue; //判断标志位

                        }
                    }

                    //所有条件判断完成
                    if(eeprom_read(baseadd+30)) beep_flag|=0x01;
                    if(eeprom_read(baseadd+31)) relay_flag|=0x01;
                }
            }

            //输出结果
            if(beep_flag) beep_on(); else beep_off();
            if(relay_flag) relay_on(); else relay_off();

    }

    if(keycount[0]||keycount[1]||keycount[2]||keycount[3]||keycount[4]) //按键处理
    {
      OLED_Clear();
    if(keycount[0])//浇水按键
        {
        static u8 is_rule_on;
        is_rule_on=eeprom_read(4);//保存规则运行信息
        relay_read()?(eeprom_write(4,is_rule_on),relay_off()):(eeprom_write(4,0),relay_on());
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
        static unsigned char temp[4][25],i;
        for(i=0;i<4;i++)//初始化temp
        {
        sprintf(temp[i],"                ");
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
        u8 j=0;
        for(j=0;j<16;j++)
        {
        if(temp[i][j]=='\0') temp[i][j]=' ';
        }
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
        sprintf(temp[3],"rule:%2d",status>>8);
        for(i=0;i<4;i++)//输出显示
        {
         u8 j=0;
        for(j=0;j<16;j++)
        {
        if(temp[i][j]=='\0') temp[i][j]=' ';
        }
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
        sprintf(temp[3],"Addr:%2d,Val:%d",(status&0xff)-1,eeprom_read((status>>8)*32+(status&0xff)-1));
        for(i=0;i<4;i++)//输出显示
        {
         u8 j=0;
        for(j=0;j<16;j++)
        {
        if(temp[i][j]=='\0') temp[i][j]=' ';
        }
        OLED_ShowString(0,i*2,temp[i]);
        }
    }
    }
    else // 关闭显示
        OLED_Clear();


}
