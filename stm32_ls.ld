ENTRY(Reset_Handler) /* Program counter will start from reset handler */

MEMORY
{
	FLASH(rx):ORIGIN = 0x08000000,LENGTH = 64K
	SRAM(rwx):ORIGIN = 0x20000000,LENGTH = 12K
}



SECTIONS
{
	.text :
	{
		*(.isr_vector)
		*(.text)
		*(.rodata)
		. = ALIGN(4);
		_etext = .; /* Ending address of .text section */
	}> FLASH
	
	.data :
	{
		_sdata = .;  /* starting address of .data section */
		*(.data)
		. = ALIGN(4);
		_edata = .; /* Ending address of .data section */
	}> SRAM AT> FLASH /* VMA and LMA */
	
	.bss :
	{
		_sbss = .; /* starting address of .bss section */
		*(.bss)
		. = ALIGN(4);
		_ebss = .; /* Ending address of .bss section */
	}> SRAM
}
