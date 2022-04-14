
CC=arm-none-eabi-gcc
COMPILER_FLAGS=-c -mcpu=cortex-m4 -mthumb
LDFLAGS=-nostdlib -T stm32_ls.ld -Wl,-Map=final.map

all:main.o startup.o final.elf

main.o:main.c 
	$(CC) $(COMPILER_FLAGS) -o $@ $^

startup.o:startup_stm32f3.c
	$(CC) $(COMPILER_FLAGS) -o $@ $^

final.elf:main.o startup.o
	$(CC) $(LDFLAGS) -o $@ $^
	
load:
	openocd -f board/st_nucleo_f3.cfg
	
clean:
	 rm -rf *.o *.elf
