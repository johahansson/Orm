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

// Typedefs
typedef unsigned int	uint32_t;
typedef unsigned short	uint16_t;
typedef unsigned char	uint8_t;

// SysTick
#define STK_BASE		0xE000E010
#define STK_CTRL		((volatile unsigned int*) (STK_BASE))
#define STK_LOAD		((volatile unsigned int*) (STK_BASE+0x4))
#define STK_VAL			((volatile unsigned int*) (STK_BASE+0x8))

#define PORT_DISPLAY_BASE 0x40021000 // MD407 port E
#define portModer ((volatile unsigned int *) (PORT_DISPLAY_BASE))
#define portOtyper ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x4))
#define portOspeedr ((volatile unsigned int *) (PORT_DISPLAY_BASE+0x8))
#define portPupdr ((volatile unsigned int *) (PORT_DISPLAY_BASE+0xC))
#define portIdr ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x10))
#define portIdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE+0x11))
#define portOdrLow ((volatile unsigned char *) (PORT_DISPLAY_BASE+0x14))
#define portOdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE+0x14+1))

/* Definiera bitar för de olika bitarna i styrregistret */
#define B_RS			0x01
#define B_RW			0x02
#define B_SELECT		0x04
#define B_CS1			0x08
#define B_CS2			0x10
#define B_RST			0x20
#define B_E				0x40

// Definition av kommandon till display, sänds via dataregister.
#define LCD_ON 			0x3F // Display on
#define LCD_OFF 		0x3E // Display off
#define LCD_SET_ADD 	0x40 // Set horizontal coordinate
#define LCD_SET_PAGE 	0xB8 // Set vertical coordinate
#define LCD_DISP_START 	0xC0 // Start address
#define LCD_BUSY 		0x80 // Read busy status

#define MAX_POINTS		20

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

static void graphic_ctrl_bit_set(uint8_t x) {
	uint8_t c;
	c = *portOdrLow;
	c &= ~B_SELECT;
	c |= (~B_SELECT & x);
	*portOdrLow = c;
}

static void graphic_ctrl_bit_clear(uint8_t x) {
	uint8_t c;
	c = *portOdrLow;
	c &= ~B_SELECT;
	c &= ~x;
	*portOdrLow = c;
}

static void select_controller(uint8_t controller) {
	switch(controller) {
		case 0:
			graphic_ctrl_bit_clear(B_CS1|B_CS2);
			break;
		case B_CS1:
			graphic_ctrl_bit_set(B_CS1);
			graphic_ctrl_bit_clear(B_CS2);
			break;
		case B_CS2:
			graphic_ctrl_bit_set(B_CS2);
			graphic_ctrl_bit_clear(B_CS1);
			break;
		case B_CS1|B_CS2:
			graphic_ctrl_bit_set(B_CS1|B_CS2);
			break;
	}
}

static void graphic_wait_ready(void) {
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x00005555;	// 15-8 inputs, 7-0 outputs
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	
	while(1) {
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c = *portIdrHigh & LCD_BUSY;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if(c == 0) break;
	}
	*portModer = 0x55555555;	// 15-0 outputs
}

static uint8_t graphic_read(uint8_t controller) {
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x00005555;	// 15-8 inputs, 7-0 outputs
	graphic_ctrl_bit_set(B_RS|B_RW);
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	c = *portIdrHigh;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x55555555;	// 15-0 outputs
	
	if(controller & B_CS1) {
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return c;
}

static uint8_t graphic_read_data(uint8_t controller) {
	graphic_read(controller);
	return graphic_read(controller);
}

static void graphic_write(uint8_t value, uint8_t controller) {
	*portOdrHigh = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	
	if(controller & B_CS1) {
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	*portOdrHigh = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}

static void graphic_write_command(uint8_t command, uint8_t controller) {
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS|B_RW);
	graphic_write(command, controller);
}

static void graphic_write_data(uint8_t data, uint8_t controller) {
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data, controller);
}

void graphic_clear_screen(void) {
	uint8_t i, j;
	
	for(j = 0; j < 8; j++) {
		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
		for(i = 0; i <= 63; i++) {
			graphic_write_data(0, B_CS1|B_CS2);
		}
	}
}

void graphic_initialize(void) {
	graphic_ctrl_bit_set(B_E);
	delay_micro(10);
	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	delay_milli(100);
	graphic_write_command(LCD_OFF,			B_CS1|B_CS2);
	graphic_write_command(LCD_ON,			B_CS1|B_CS2);
	graphic_write_command(LCD_DISP_START,	B_CS1|B_CS2);
	graphic_write_command(LCD_SET_ADD,		B_CS1|B_CS2);
	graphic_write_command(LCD_SET_PAGE,		B_CS1|B_CS2);
	select_controller(0);
}

void pixel(int x, int y, int set) {
	uint8_t mask, c, controller;
	int index;
	
	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
	
	index = (y-1)/8;
	mask = 1 << ((y - 1) % 8);
	
	if(set == 0)
		mask = ~mask;
		
	if(x > 64) {
		controller = B_CS2;
		x = x - 65;
	} else {
		controller = B_CS1;
		x = x - 1;
	}
	
	graphic_write_command(LCD_SET_ADD	| x, controller);
	graphic_write_command(LCD_SET_PAGE	| index, controller);
	c = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD	| x, controller);
	
	if(set)
		mask = mask | c;
	else
		mask = mask & c;
		
	graphic_write_data(mask, controller);
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
	#ifdef SIMULATOR
		while( ms-- )
			delay_micro(1);
	#else
		while( ms-- )
			delay_micro(1000);
	#endif
}

void init_app(void) {
	*portModer = 0x55555555;	// 15-0 outport
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
	graphic_clear_screen();
#endif
	p->set_speed(p, 4, 1);
	while(1) {
		p->move(p);
		delay_milli(40);
	}
}
