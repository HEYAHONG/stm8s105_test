#include "iwdg.h"
void WitchDog_init()//��ʼ��
{
  IWDG_Enable();//�����������Ź�
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);//��������������Ź�
  IWDG_SetPrescaler(IWDG_Prescaler_256);//���Ź�Ԥ��Ƶ
  IWDG_SetReload((uint8_t)0xff);//���ÿ��Ź���λʱ��
  
}
void WitchDog_reset()//ι��
{
      IWDG_ReloadCounter();//���Ź���λ ����ʹ��ʱ���뷢�����Ź���λ����ִ��
}
