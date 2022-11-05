esptool.exe elf2image blink.elf
esptool.exe -p com4 erase_flash
esptool.exe -p com4 write_flash 0 blink.elf-0x00000.bin
pause 0