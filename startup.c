void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

#include <stdint.h>
#include "graphics.h"
#include "defines.h"
#include "delays.h"
#include "keypad.h"
#include "ball.h"

void init_app(void) {
	// Display init
	GPIO_E->moder = 0x55555555;
	
	// Keypad init
	GPIO_D->moder = 0x55005555;
	GPIO_D->otyper &= 0x0FFF;
	GPIO_D->pupdr |= 0xAAAAAAAA;
}

GEOMETRY ball_geometry =
{
	12,
	4,4,
	{
		{0,1}, {0,2}, {1,0}, {1,1}, {1,2},
		{1,3}, {2,0}, {2,1}, {2,2}, {2,3},
		{3,1}, {3,2}
	}
};
	
OBJECT ball =
{
	&ball_geometry,
	0,0,
	1,1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};

void main(void) {	
	POBJECT p = &ball;
	init_app();
	graphic_initialize();
#ifndef SIMULATOR
	//graphic_clear_screen();
#endif
	int speed = 10;
	p->set_speed(p, 4, 1);
	while(1) {
		p->move(p);
		//delay_milli(40);
		
		switch (keyb()) {
			case 2: p->set_speed(p, 0, -speed); break;
			case 4: p->set_speed(p, -speed, 0); break;
			case 6: p->set_speed(p, speed, 0); break;
			case 8: p->set_speed(p, 0, speed); break;
		}
	}
}


