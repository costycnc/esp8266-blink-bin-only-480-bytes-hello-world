# esp8266-blink-bin-only-480-bytes-hello-world
Blink with a bin with only 480 bytes

         Requirements :

               1.esptool.exe https://github.com/espressif/esptool/releases or esptool.py but need to install python 
               2.toolchain https://dl.espressif.com/dl/xtensa-lx106-elf-gcc8_4_0-esp-2020r3-win32.zip 
                     here more details(https://docs.espressif.com/projects/esp8266-rtos-sdk/en/latest/get-started/windows-setup.html)
  
        First test:
        You can go directly in esptool folder ... open write_flash.bat with a text editor
  
                esptool.exe elf2image blink.elf
                esptool.exe -p com4 erase_flash
                esptool.exe -p com4 write_flash 0 blink.elf-0x00000.bin
                
         and change com4 port with your port where is connected esp8266
         save and run
         
         After few seconds will see esp866 blinking only with a 480 bytes bin!!!!
         
         Second test:
         Go in "esp8266 blink.bin with only 480 bytes/esp8266_asm" folder and open blink.c with an text editor
         
                                #define GPIO_ENSET      0x60000310
                                #define GPIO_OUTSET     0x60000304
                                #define GPIO_OUTCLR     0x60000308
                                #define IOMUX_GPIO2     0x60000838

                                void dummy ( unsigned int );
                                void PUT32 ( unsigned int, unsigned int );
                                unsigned GET32 ( unsigned int );

                                void notmain ( void )
                                {
                                    unsigned int ra;
                                    unsigned int rx;
                                    ra=GET32(IOMUX_GPIO2);
                                    ra&=(~0x130);
                                    PUT32(IOMUX_GPIO2,ra);
                                    PUT32(GPIO_ENSET,1<<2);
                                    while(1)
                                    {
                                        PUT32(GPIO_OUTSET,1<<2);
                                        for(rx=0;rx<400000;rx++) dummy(rx);
                                        PUT32(GPIO_OUTCLR,1<<2);
                                        for(rx=0;rx<400000;rx++) dummy(rx);
                                    }
                                }
                                
            change 400000 with another value ... is time blinkink on and off ... and save file
            
            
         
         

  
  
