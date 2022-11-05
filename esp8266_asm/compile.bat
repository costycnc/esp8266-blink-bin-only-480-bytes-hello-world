echo off
\xtensa-lx106-elf\bin\xtensa-lx106-elf-as.exe --warn --fatal-warnings vectors.s -o main/vectors.o 
rem \xtensa-lx106-elf\bin\xtensa-lx106-elf-g++.exe -Wall -Wextra -Werror -O2 -ffreestanding -lstdc++ -c so.cpp -o main/so.o
\xtensa-lx106-elf\bin\xtensa-lx106-elf-gcc.exe blink.c -Wall -g -c -o main/blink.o
\xtensa-lx106-elf\bin\xtensa-lx106-elf-ld.exe -nostdlib -nostartfiles -T blink.ld main/vectors.o main/blink.o -o main/blink.elf
\xtensa-lx106-elf\bin\xtensa-lx106-elf-objdump.exe -D main/blink.elf > main/blink.list
rem \xtensa-lx106-elf\bin\xtensa-lx106-elf-objcopy.exe main/blink.elf main/blink.bin -O binary
pause 0