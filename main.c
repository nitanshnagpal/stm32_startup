#include "stdint.h"

#define RCC_AHB_REG	(uint32_t*)(0x40021000 + 0x14)
#define GPIOA		(uint32_t*)0x48000000
#define GPIOA_ODR	(uint32_t*)(0x48000000 + 0x14)

uint32_t *rcc_ahb = RCC_AHB_REG;
uint32_t *gpioa = GPIOA;
uint32_t *gpioa_odr = GPIOA_ODR;

void Delay(uint32_t time)
{
	for(uint32_t i=0; i<time; i++);
}

int main()
{
	
	*rcc_ahb |= (1 << 17); // Enable GPIOA Clock
	
	/* PA5 as Output Pin */
	*gpioa |= (1 << 10);
	*gpioa &= ~(1 << 11);
	
	while(1)
	{
		/* Toggle PA5 Pin */
		Delay(100000);	
		*gpioa_odr |= (1 << 5);
		Delay(100000);		
		*gpioa_odr &= ~(1 << 5); 
	}
	
}


