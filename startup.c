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

typedef struct tPoint {
	uint8_t x;
	uint8_t y;
} POINT;

typedef struct tGeometry {
	int numpoints;
	int sizex;
	int sizey;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj {
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void (*draw)(struct tObj*);
	void (*clear)(struct tObj*);
	void (*move)(struct tObj*);
	void (*set_speed)(struct tObj*, int, int);
} OBJECT, *POBJECT;

void set_object_speed(POBJECT o, int speedx, int speedy) {
	o->dirx = speedx;
	o->diry = speedy;
}

void draw_object(POBJECT o) {
	for(int i = 0; i < o->geo->numpoints; i++) {
		pixel(o->geo->px[i].x, o->geo->px[i].y, 1);
	}
}

void clear_object(POBJECT o) {
	for(int i = 0; i < o->geo->numpoints; i++) {
		pixel(o->geo->px[i].x, o->geo->px[i].y, 0);
	}
}

void move_object(POBJECT o) {
	clear_object(o);
	
	for(int i = 0; i < o->geo->numpoints; i++) {
		o->geo->px[i].x += o->dirx;
		o->geo->px[i].y += o->diry;
	}
	o->posx += o->dirx;
	o->posy += o->diry;
	
	if(o->posx < 1)
		o->dirx *= -1;
	if((o->posx + o->geo->sizex) > 128)
		o->dirx *= -1;
	if(o->posy < 1)
		o->diry *= -1;
	if((o->posy + o->geo->sizey) > 64)
		o->diry *= -1;
		
	draw_object(o);
}

void delay_250ns(void) {
	*STK_CTRL = 0;				// clear SysTik
	*STK_LOAD = 41;				// initialize with 42 cycles
	*STK_VAL = 0;				// clear countregister
	*STK_CTRL = 5;				// reset counter
	while ((*STK_CTRL & 0x00010000) == 0) {}	// wait until COUNTFLAG = 1
	*STK_CTRL = 0;				// clear SysTik
}

void delay_500ns(void) {
	delay_250ns();
	delay_250ns();
}

void delay_micro(unsigned int us) {
	while(us--) {
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	} 
}

void delay_milli(unsigned int ms) {
//	#ifdef SIMULATOR
		while( ms-- )
			delay_micro(1);
//	#else
//		while( ms-- )
//			delay_micro(1000);
//	#endif
}

void kbdActivate(unsigned int row){
	switch(row){
		case 1: GPIO_D->odrHigh = 0x10; break;
		case 2: GPIO_D->odrHigh = 0x20; break;
		case 3: GPIO_D->odrHigh = 0x40; break;
		case 4: GPIO_D->odrHigh = 0x80; break;
		case 0: GPIO_D->odrHigh = 0x00; break;
	}
}

int kbdGetCol(void){
	unsigned char c;
	c = GPIO_D->idrHigh;
	if(c & 0x8) return 4;
	if(c & 0x4) return 3;
	if(c & 0x2) return 2;
	if(c & 0x1) return 1;
	return 0;
}

unsigned char keyb(void){
	unsigned char key[] = {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
	int row, col;
	for(row = 1; row <= 4; row++){
		kbdActivate(row);
		if(col = kbdGetCol()){
			kbdActivate(0);
			return key [4*(row-1)+(col-1)];
		}
	}
	kbdActivate(0);
	return 0xFF;
}

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


