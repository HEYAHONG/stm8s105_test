#include "eeprom.h"

u8 eeprom_read(u32 num) {
return FLASH_ReadByte(ADDR_OFFSET+num);
}

u8 eeprom_write(u32 num,u8 data){
//解锁eeprom
FLASH_Unlock(FLASH_MEMTYPE_DATA);
while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET); //等待解锁标志位置位
FLASH_ProgramByte(ADDR_OFFSET+num,data);
FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
FLASH_Lock(FLASH_MEMTYPE_DATA);

return eeprom_read(num);
}