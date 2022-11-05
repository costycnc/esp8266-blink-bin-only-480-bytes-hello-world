open file write_flash.bat with a text editor
  
                esptool.exe elf2image blink.elf
                esptool.exe -p com4 erase_flash
                esptool.exe -p com4 write_flash 0 blink.elf-0x00000.bin
                
         and change com4 port with your port where is connected esp8266
         save and run
