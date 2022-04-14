# stm32_startup

Startup and Linker file for STM32F3xx Microcontroller

# Compiling code on Linux

1. First Install Compiler toolchain for Arm
  <pre>sudo apt-get install arm-none-eabi-gcc</pre>
  
2. Then go to directory on terminal where you have downloaded this code and run the following command.
  <pre>make all</pre>
 
# Flashing code on Microcontroller

1. Install OpenOCD and Putty on your system
2. Run the following command on your terminal
  <pre>make load</pre>

3. Open putty and click on telnet session and give port number 4444 and hostname - localhost
4. Run the following commands on putty
  <pre>
  reset init
  flash write_image erase final.elf
  resume
  </pre>
