   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "C:/Users/johan/google_drive/Programmering/Git/Orm/startup.c"
   1:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   2:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
   3:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void startup ( void )
   4:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** {
  26              		.loc 1 4 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   5:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** __asm volatile(
  31              		.loc 1 5 0
  32              		.syntax divided
  33              	@ 5 "C:/Users/johan/google_drive/Programmering/Git/Orm/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
   6:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
   7:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	" MOV SP,R0\n"
   8:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	" BL main\n"				/* call main */
   9:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	"_exit: B .\n"				/* never return */
  10:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	) ;
  11:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
  40              		.loc 1 11 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	set_object_speed
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	set_object_speed:
  56              	.LFB1:
  12:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  13:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #include <stdint.h>
  14:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  15:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** // SysTick
  16:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define STK_BASE		0xE000E010
  17:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define STK_CTRL		((volatile unsigned int*) (STK_BASE))
  18:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define STK_LOAD		((volatile unsigned int*) (STK_BASE+0x4))
  19:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define STK_VAL			((volatile unsigned int*) (STK_BASE+0x8))
  20:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  21:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** typedef struct {
  22:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned int	moder;
  23:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned short	otyper;
  24:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned short	otReserved;
  25:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned int	ospeedr;
  26:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned int	pupdr;
  27:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned char	idrLow;
  28:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned char	idrHigh;
  29:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned short	idrReserved;
  30:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned char	odrLow;
  31:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned char	odrHigh;
  32:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned short	odrReserved;
  33:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** } GPIO;
  34:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  35:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //#define GPIO_D 				((volatile GPIO*) 0x40020c00)
  36:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define GPIO_E				((volatile GPIO*) 0x40021000)
  37:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  38:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** /* Definiera bitar för de olika bitarna i styrregistret */
  39:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define B_RS			0x01
  40:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define B_RW			0x02
  41:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define B_SELECT		0x04
  42:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define B_CS1			0x08
  43:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define B_CS2			0x10
  44:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define B_RST			0x20
  45:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define B_E				0x40
  46:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  47:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** // Definition av kommandon till display, sänds via dataregister.
  48:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define LCD_ON 			0x3F // Display on
  49:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define LCD_OFF 		0x3E // Display off
  50:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define LCD_SET_ADD 	0x40 // Set horizontal coordinate
  51:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define LCD_SET_PAGE 	0xB8 // Set vertical coordinate
  52:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define LCD_DISP_START 	0xC0 // Start address
  53:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define LCD_BUSY 		0x80 // Read busy status
  54:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  55:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #define MAX_POINTS		20
  56:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  57:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** typedef struct tPoint {
  58:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t x;
  59:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t y;
  60:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** } POINT;
  61:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  62:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** typedef struct tGeometry {
  63:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int numpoints;
  64:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int sizex;
  65:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int sizey;
  66:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	POINT px[MAX_POINTS];
  67:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** } GEOMETRY, *PGEOMETRY;
  68:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  69:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** typedef struct tObj {
  70:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	PGEOMETRY geo;
  71:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int dirx, diry;
  72:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int posx, posy;
  73:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*draw)(struct tObj*);
  74:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*clear)(struct tObj*);
  75:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*move)(struct tObj*);
  76:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*set_speed)(struct tObj*, int, int);
  77:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** } OBJECT, *POBJECT;
  78:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  79:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy) {
  57              		.loc 1 79 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 16
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 84B0     		sub	sp, sp, #16
  66              		.cfi_def_cfa_offset 24
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 F860     		str	r0, [r7, #12]
  70 0008 B960     		str	r1, [r7, #8]
  71 000a 7A60     		str	r2, [r7, #4]
  80:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->dirx = speedx;
  72              		.loc 1 80 0
  73 000c FB68     		ldr	r3, [r7, #12]
  74 000e BA68     		ldr	r2, [r7, #8]
  75 0010 5A60     		str	r2, [r3, #4]
  81:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->diry = speedy;
  76              		.loc 1 81 0
  77 0012 FB68     		ldr	r3, [r7, #12]
  78 0014 7A68     		ldr	r2, [r7, #4]
  79 0016 9A60     		str	r2, [r3, #8]
  82:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
  80              		.loc 1 82 0
  81 0018 C046     		nop
  82 001a BD46     		mov	sp, r7
  83 001c 04B0     		add	sp, sp, #16
  84              		@ sp needed
  85 001e 80BD     		pop	{r7, pc}
  86              		.cfi_endproc
  87              	.LFE1:
  89              		.align	1
  90              		.global	draw_object
  91              		.syntax unified
  92              		.code	16
  93              		.thumb_func
  94              		.fpu softvfp
  96              	draw_object:
  97              	.LFB2:
  83:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  84:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void draw_object(POBJECT o) {
  98              		.loc 1 84 0
  99              		.cfi_startproc
 100              		@ args = 0, pretend = 0, frame = 16
 101              		@ frame_needed = 1, uses_anonymous_args = 0
 102 0020 80B5     		push	{r7, lr}
 103              		.cfi_def_cfa_offset 8
 104              		.cfi_offset 7, -8
 105              		.cfi_offset 14, -4
 106 0022 84B0     		sub	sp, sp, #16
 107              		.cfi_def_cfa_offset 24
 108 0024 00AF     		add	r7, sp, #0
 109              		.cfi_def_cfa_register 7
 110 0026 7860     		str	r0, [r7, #4]
 111              	.LBB2:
  85:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 112              		.loc 1 85 0
 113 0028 0023     		movs	r3, #0
 114 002a FB60     		str	r3, [r7, #12]
 115 002c 17E0     		b	.L4
 116              	.L5:
 117              	.LBB3:
  86:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		pixel(o->geo->px[i].x, o->geo->px[i].y, 1);
 118              		.loc 1 86 0 discriminator 3
 119 002e 7B68     		ldr	r3, [r7, #4]
 120 0030 1A68     		ldr	r2, [r3]
 121 0032 FB68     		ldr	r3, [r7, #12]
 122 0034 0433     		adds	r3, r3, #4
 123 0036 5B00     		lsls	r3, r3, #1
 124 0038 D318     		adds	r3, r2, r3
 125 003a 0433     		adds	r3, r3, #4
 126 003c 1B78     		ldrb	r3, [r3]
 127 003e 1800     		movs	r0, r3
 128 0040 7B68     		ldr	r3, [r7, #4]
 129 0042 1A68     		ldr	r2, [r3]
 130 0044 FB68     		ldr	r3, [r7, #12]
 131 0046 0433     		adds	r3, r3, #4
 132 0048 5B00     		lsls	r3, r3, #1
 133 004a D318     		adds	r3, r2, r3
 134 004c 0533     		adds	r3, r3, #5
 135 004e 1B78     		ldrb	r3, [r3]
 136 0050 0122     		movs	r2, #1
 137 0052 1900     		movs	r1, r3
 138 0054 FFF7FEFF 		bl	pixel
 139              	.LBE3:
  85:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 140              		.loc 1 85 0 discriminator 3
 141 0058 FB68     		ldr	r3, [r7, #12]
 142 005a 0133     		adds	r3, r3, #1
 143 005c FB60     		str	r3, [r7, #12]
 144              	.L4:
  85:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 145              		.loc 1 85 0 is_stmt 0 discriminator 1
 146 005e 7B68     		ldr	r3, [r7, #4]
 147 0060 1B68     		ldr	r3, [r3]
 148 0062 1B68     		ldr	r3, [r3]
 149 0064 FA68     		ldr	r2, [r7, #12]
 150 0066 9A42     		cmp	r2, r3
 151 0068 E1DB     		blt	.L5
 152              	.LBE2:
  87:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
  88:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 153              		.loc 1 88 0 is_stmt 1
 154 006a C046     		nop
 155 006c BD46     		mov	sp, r7
 156 006e 04B0     		add	sp, sp, #16
 157              		@ sp needed
 158 0070 80BD     		pop	{r7, pc}
 159              		.cfi_endproc
 160              	.LFE2:
 162              		.align	1
 163              		.global	clear_object
 164              		.syntax unified
 165              		.code	16
 166              		.thumb_func
 167              		.fpu softvfp
 169              	clear_object:
 170              	.LFB3:
  89:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  90:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void clear_object(POBJECT o) {
 171              		.loc 1 90 0
 172              		.cfi_startproc
 173              		@ args = 0, pretend = 0, frame = 16
 174              		@ frame_needed = 1, uses_anonymous_args = 0
 175 0072 80B5     		push	{r7, lr}
 176              		.cfi_def_cfa_offset 8
 177              		.cfi_offset 7, -8
 178              		.cfi_offset 14, -4
 179 0074 84B0     		sub	sp, sp, #16
 180              		.cfi_def_cfa_offset 24
 181 0076 00AF     		add	r7, sp, #0
 182              		.cfi_def_cfa_register 7
 183 0078 7860     		str	r0, [r7, #4]
 184              	.LBB4:
  91:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 185              		.loc 1 91 0
 186 007a 0023     		movs	r3, #0
 187 007c FB60     		str	r3, [r7, #12]
 188 007e 17E0     		b	.L7
 189              	.L8:
 190              	.LBB5:
  92:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		pixel(o->geo->px[i].x, o->geo->px[i].y, 0);
 191              		.loc 1 92 0 discriminator 3
 192 0080 7B68     		ldr	r3, [r7, #4]
 193 0082 1A68     		ldr	r2, [r3]
 194 0084 FB68     		ldr	r3, [r7, #12]
 195 0086 0433     		adds	r3, r3, #4
 196 0088 5B00     		lsls	r3, r3, #1
 197 008a D318     		adds	r3, r2, r3
 198 008c 0433     		adds	r3, r3, #4
 199 008e 1B78     		ldrb	r3, [r3]
 200 0090 1800     		movs	r0, r3
 201 0092 7B68     		ldr	r3, [r7, #4]
 202 0094 1A68     		ldr	r2, [r3]
 203 0096 FB68     		ldr	r3, [r7, #12]
 204 0098 0433     		adds	r3, r3, #4
 205 009a 5B00     		lsls	r3, r3, #1
 206 009c D318     		adds	r3, r2, r3
 207 009e 0533     		adds	r3, r3, #5
 208 00a0 1B78     		ldrb	r3, [r3]
 209 00a2 0022     		movs	r2, #0
 210 00a4 1900     		movs	r1, r3
 211 00a6 FFF7FEFF 		bl	pixel
 212              	.LBE5:
  91:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 213              		.loc 1 91 0 discriminator 3
 214 00aa FB68     		ldr	r3, [r7, #12]
 215 00ac 0133     		adds	r3, r3, #1
 216 00ae FB60     		str	r3, [r7, #12]
 217              	.L7:
  91:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 218              		.loc 1 91 0 is_stmt 0 discriminator 1
 219 00b0 7B68     		ldr	r3, [r7, #4]
 220 00b2 1B68     		ldr	r3, [r3]
 221 00b4 1B68     		ldr	r3, [r3]
 222 00b6 FA68     		ldr	r2, [r7, #12]
 223 00b8 9A42     		cmp	r2, r3
 224 00ba E1DB     		blt	.L8
 225              	.LBE4:
  93:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
  94:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 226              		.loc 1 94 0 is_stmt 1
 227 00bc C046     		nop
 228 00be BD46     		mov	sp, r7
 229 00c0 04B0     		add	sp, sp, #16
 230              		@ sp needed
 231 00c2 80BD     		pop	{r7, pc}
 232              		.cfi_endproc
 233              	.LFE3:
 235              		.align	1
 236              		.global	move_object
 237              		.syntax unified
 238              		.code	16
 239              		.thumb_func
 240              		.fpu softvfp
 242              	move_object:
 243              	.LFB4:
  95:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  96:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void move_object(POBJECT o) {
 244              		.loc 1 96 0
 245              		.cfi_startproc
 246              		@ args = 0, pretend = 0, frame = 16
 247              		@ frame_needed = 1, uses_anonymous_args = 0
 248 00c4 80B5     		push	{r7, lr}
 249              		.cfi_def_cfa_offset 8
 250              		.cfi_offset 7, -8
 251              		.cfi_offset 14, -4
 252 00c6 84B0     		sub	sp, sp, #16
 253              		.cfi_def_cfa_offset 24
 254 00c8 00AF     		add	r7, sp, #0
 255              		.cfi_def_cfa_register 7
 256 00ca 7860     		str	r0, [r7, #4]
  97:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	clear_object(o);
 257              		.loc 1 97 0
 258 00cc 7B68     		ldr	r3, [r7, #4]
 259 00ce 1800     		movs	r0, r3
 260 00d0 FFF7FEFF 		bl	clear_object
 261              	.LBB6:
  98:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
  99:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 262              		.loc 1 99 0
 263 00d4 0023     		movs	r3, #0
 264 00d6 FB60     		str	r3, [r7, #12]
 265 00d8 2EE0     		b	.L10
 266              	.L11:
 100:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 267              		.loc 1 100 0 discriminator 3
 268 00da 7B68     		ldr	r3, [r7, #4]
 269 00dc 1A68     		ldr	r2, [r3]
 270 00de FB68     		ldr	r3, [r7, #12]
 271 00e0 0433     		adds	r3, r3, #4
 272 00e2 5B00     		lsls	r3, r3, #1
 273 00e4 D318     		adds	r3, r2, r3
 274 00e6 0433     		adds	r3, r3, #4
 275 00e8 1878     		ldrb	r0, [r3]
 276 00ea 7B68     		ldr	r3, [r7, #4]
 277 00ec 5B68     		ldr	r3, [r3, #4]
 278 00ee D9B2     		uxtb	r1, r3
 279 00f0 7B68     		ldr	r3, [r7, #4]
 280 00f2 1A68     		ldr	r2, [r3]
 281 00f4 4318     		adds	r3, r0, r1
 282 00f6 D9B2     		uxtb	r1, r3
 283 00f8 FB68     		ldr	r3, [r7, #12]
 284 00fa 0433     		adds	r3, r3, #4
 285 00fc 5B00     		lsls	r3, r3, #1
 286 00fe D318     		adds	r3, r2, r3
 287 0100 0433     		adds	r3, r3, #4
 288 0102 0A1C     		adds	r2, r1, #0
 289 0104 1A70     		strb	r2, [r3]
 101:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].y += o->diry;
 290              		.loc 1 101 0 discriminator 3
 291 0106 7B68     		ldr	r3, [r7, #4]
 292 0108 1A68     		ldr	r2, [r3]
 293 010a FB68     		ldr	r3, [r7, #12]
 294 010c 0433     		adds	r3, r3, #4
 295 010e 5B00     		lsls	r3, r3, #1
 296 0110 D318     		adds	r3, r2, r3
 297 0112 0533     		adds	r3, r3, #5
 298 0114 1878     		ldrb	r0, [r3]
 299 0116 7B68     		ldr	r3, [r7, #4]
 300 0118 9B68     		ldr	r3, [r3, #8]
 301 011a D9B2     		uxtb	r1, r3
 302 011c 7B68     		ldr	r3, [r7, #4]
 303 011e 1A68     		ldr	r2, [r3]
 304 0120 4318     		adds	r3, r0, r1
 305 0122 D9B2     		uxtb	r1, r3
 306 0124 FB68     		ldr	r3, [r7, #12]
 307 0126 0433     		adds	r3, r3, #4
 308 0128 5B00     		lsls	r3, r3, #1
 309 012a D318     		adds	r3, r2, r3
 310 012c 0533     		adds	r3, r3, #5
 311 012e 0A1C     		adds	r2, r1, #0
 312 0130 1A70     		strb	r2, [r3]
  99:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 313              		.loc 1 99 0 discriminator 3
 314 0132 FB68     		ldr	r3, [r7, #12]
 315 0134 0133     		adds	r3, r3, #1
 316 0136 FB60     		str	r3, [r7, #12]
 317              	.L10:
  99:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 318              		.loc 1 99 0 is_stmt 0 discriminator 1
 319 0138 7B68     		ldr	r3, [r7, #4]
 320 013a 1B68     		ldr	r3, [r3]
 321 013c 1B68     		ldr	r3, [r3]
 322 013e FA68     		ldr	r2, [r7, #12]
 323 0140 9A42     		cmp	r2, r3
 324 0142 CADB     		blt	.L11
 325              	.LBE6:
 102:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 103:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->posx += o->dirx;
 326              		.loc 1 103 0 is_stmt 1
 327 0144 7B68     		ldr	r3, [r7, #4]
 328 0146 DA68     		ldr	r2, [r3, #12]
 329 0148 7B68     		ldr	r3, [r7, #4]
 330 014a 5B68     		ldr	r3, [r3, #4]
 331 014c D218     		adds	r2, r2, r3
 332 014e 7B68     		ldr	r3, [r7, #4]
 333 0150 DA60     		str	r2, [r3, #12]
 104:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->posy += o->diry;
 334              		.loc 1 104 0
 335 0152 7B68     		ldr	r3, [r7, #4]
 336 0154 1A69     		ldr	r2, [r3, #16]
 337 0156 7B68     		ldr	r3, [r7, #4]
 338 0158 9B68     		ldr	r3, [r3, #8]
 339 015a D218     		adds	r2, r2, r3
 340 015c 7B68     		ldr	r3, [r7, #4]
 341 015e 1A61     		str	r2, [r3, #16]
 105:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 106:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(o->posx < 1)
 342              		.loc 1 106 0
 343 0160 7B68     		ldr	r3, [r7, #4]
 344 0162 DB68     		ldr	r3, [r3, #12]
 345 0164 002B     		cmp	r3, #0
 346 0166 04DC     		bgt	.L12
 107:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->dirx *= -1;
 347              		.loc 1 107 0
 348 0168 7B68     		ldr	r3, [r7, #4]
 349 016a 5B68     		ldr	r3, [r3, #4]
 350 016c 5A42     		rsbs	r2, r3, #0
 351 016e 7B68     		ldr	r3, [r7, #4]
 352 0170 5A60     		str	r2, [r3, #4]
 353              	.L12:
 108:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if((o->posx + o->geo->sizex) > 128)
 354              		.loc 1 108 0
 355 0172 7B68     		ldr	r3, [r7, #4]
 356 0174 DA68     		ldr	r2, [r3, #12]
 357 0176 7B68     		ldr	r3, [r7, #4]
 358 0178 1B68     		ldr	r3, [r3]
 359 017a 5B68     		ldr	r3, [r3, #4]
 360 017c D318     		adds	r3, r2, r3
 361 017e 802B     		cmp	r3, #128
 362 0180 04DD     		ble	.L13
 109:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->dirx *= -1;
 363              		.loc 1 109 0
 364 0182 7B68     		ldr	r3, [r7, #4]
 365 0184 5B68     		ldr	r3, [r3, #4]
 366 0186 5A42     		rsbs	r2, r3, #0
 367 0188 7B68     		ldr	r3, [r7, #4]
 368 018a 5A60     		str	r2, [r3, #4]
 369              	.L13:
 110:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(o->posy < 1)
 370              		.loc 1 110 0
 371 018c 7B68     		ldr	r3, [r7, #4]
 372 018e 1B69     		ldr	r3, [r3, #16]
 373 0190 002B     		cmp	r3, #0
 374 0192 04DC     		bgt	.L14
 111:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->diry *= -1;
 375              		.loc 1 111 0
 376 0194 7B68     		ldr	r3, [r7, #4]
 377 0196 9B68     		ldr	r3, [r3, #8]
 378 0198 5A42     		rsbs	r2, r3, #0
 379 019a 7B68     		ldr	r3, [r7, #4]
 380 019c 9A60     		str	r2, [r3, #8]
 381              	.L14:
 112:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if((o->posy + o->geo->sizey) > 64)
 382              		.loc 1 112 0
 383 019e 7B68     		ldr	r3, [r7, #4]
 384 01a0 1A69     		ldr	r2, [r3, #16]
 385 01a2 7B68     		ldr	r3, [r7, #4]
 386 01a4 1B68     		ldr	r3, [r3]
 387 01a6 9B68     		ldr	r3, [r3, #8]
 388 01a8 D318     		adds	r3, r2, r3
 389 01aa 402B     		cmp	r3, #64
 390 01ac 04DD     		ble	.L15
 113:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->diry *= -1;
 391              		.loc 1 113 0
 392 01ae 7B68     		ldr	r3, [r7, #4]
 393 01b0 9B68     		ldr	r3, [r3, #8]
 394 01b2 5A42     		rsbs	r2, r3, #0
 395 01b4 7B68     		ldr	r3, [r7, #4]
 396 01b6 9A60     		str	r2, [r3, #8]
 397              	.L15:
 114:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		
 115:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	draw_object(o);
 398              		.loc 1 115 0
 399 01b8 7B68     		ldr	r3, [r7, #4]
 400 01ba 1800     		movs	r0, r3
 401 01bc FFF7FEFF 		bl	draw_object
 116:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 402              		.loc 1 116 0
 403 01c0 C046     		nop
 404 01c2 BD46     		mov	sp, r7
 405 01c4 04B0     		add	sp, sp, #16
 406              		@ sp needed
 407 01c6 80BD     		pop	{r7, pc}
 408              		.cfi_endproc
 409              	.LFE4:
 411              		.align	1
 412              		.syntax unified
 413              		.code	16
 414              		.thumb_func
 415              		.fpu softvfp
 417              	graphic_ctrl_bit_set:
 418              	.LFB5:
 117:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 118:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static void graphic_ctrl_bit_set(uint8_t x) {
 419              		.loc 1 118 0
 420              		.cfi_startproc
 421              		@ args = 0, pretend = 0, frame = 16
 422              		@ frame_needed = 1, uses_anonymous_args = 0
 423 01c8 80B5     		push	{r7, lr}
 424              		.cfi_def_cfa_offset 8
 425              		.cfi_offset 7, -8
 426              		.cfi_offset 14, -4
 427 01ca 84B0     		sub	sp, sp, #16
 428              		.cfi_def_cfa_offset 24
 429 01cc 00AF     		add	r7, sp, #0
 430              		.cfi_def_cfa_register 7
 431 01ce 0200     		movs	r2, r0
 432 01d0 FB1D     		adds	r3, r7, #7
 433 01d2 1A70     		strb	r2, [r3]
 119:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t c;
 120:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c = GPIO_E->odrLow;
 434              		.loc 1 120 0
 435 01d4 0F4A     		ldr	r2, .L17
 436 01d6 0F20     		movs	r0, #15
 437 01d8 3B18     		adds	r3, r7, r0
 438 01da 127D     		ldrb	r2, [r2, #20]
 439 01dc 1A70     		strb	r2, [r3]
 121:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c &= ~B_SELECT;
 440              		.loc 1 121 0
 441 01de 3B18     		adds	r3, r7, r0
 442 01e0 3A18     		adds	r2, r7, r0
 443 01e2 1278     		ldrb	r2, [r2]
 444 01e4 0421     		movs	r1, #4
 445 01e6 8A43     		bics	r2, r1
 446 01e8 1A70     		strb	r2, [r3]
 122:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c |= (~B_SELECT & x);
 447              		.loc 1 122 0
 448 01ea FB1D     		adds	r3, r7, #7
 449 01ec 1B78     		ldrb	r3, [r3]
 450 01ee 5BB2     		sxtb	r3, r3
 451 01f0 0422     		movs	r2, #4
 452 01f2 9343     		bics	r3, r2
 453 01f4 5AB2     		sxtb	r2, r3
 454 01f6 3B18     		adds	r3, r7, r0
 455 01f8 1B78     		ldrb	r3, [r3]
 456 01fa 5BB2     		sxtb	r3, r3
 457 01fc 1343     		orrs	r3, r2
 458 01fe 5AB2     		sxtb	r2, r3
 459 0200 3B18     		adds	r3, r7, r0
 460 0202 1A70     		strb	r2, [r3]
 123:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->odrLow = c;
 461              		.loc 1 123 0
 462 0204 034A     		ldr	r2, .L17
 463 0206 3B18     		adds	r3, r7, r0
 464 0208 1B78     		ldrb	r3, [r3]
 465 020a 1375     		strb	r3, [r2, #20]
 124:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 466              		.loc 1 124 0
 467 020c C046     		nop
 468 020e BD46     		mov	sp, r7
 469 0210 04B0     		add	sp, sp, #16
 470              		@ sp needed
 471 0212 80BD     		pop	{r7, pc}
 472              	.L18:
 473              		.align	2
 474              	.L17:
 475 0214 00100240 		.word	1073876992
 476              		.cfi_endproc
 477              	.LFE5:
 479              		.align	1
 480              		.syntax unified
 481              		.code	16
 482              		.thumb_func
 483              		.fpu softvfp
 485              	graphic_ctrl_bit_clear:
 486              	.LFB6:
 125:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 126:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static void graphic_ctrl_bit_clear(uint8_t x) {
 487              		.loc 1 126 0
 488              		.cfi_startproc
 489              		@ args = 0, pretend = 0, frame = 16
 490              		@ frame_needed = 1, uses_anonymous_args = 0
 491 0218 80B5     		push	{r7, lr}
 492              		.cfi_def_cfa_offset 8
 493              		.cfi_offset 7, -8
 494              		.cfi_offset 14, -4
 495 021a 84B0     		sub	sp, sp, #16
 496              		.cfi_def_cfa_offset 24
 497 021c 00AF     		add	r7, sp, #0
 498              		.cfi_def_cfa_register 7
 499 021e 0200     		movs	r2, r0
 500 0220 FB1D     		adds	r3, r7, #7
 501 0222 1A70     		strb	r2, [r3]
 127:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t c;
 128:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c = GPIO_E->odrLow;
 502              		.loc 1 128 0
 503 0224 0F4A     		ldr	r2, .L20
 504 0226 0F20     		movs	r0, #15
 505 0228 3B18     		adds	r3, r7, r0
 506 022a 127D     		ldrb	r2, [r2, #20]
 507 022c 1A70     		strb	r2, [r3]
 129:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c &= ~B_SELECT;
 508              		.loc 1 129 0
 509 022e 3B18     		adds	r3, r7, r0
 510 0230 3A18     		adds	r2, r7, r0
 511 0232 1278     		ldrb	r2, [r2]
 512 0234 0421     		movs	r1, #4
 513 0236 8A43     		bics	r2, r1
 514 0238 1A70     		strb	r2, [r3]
 130:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c &= ~x;
 515              		.loc 1 130 0
 516 023a FB1D     		adds	r3, r7, #7
 517 023c 1B78     		ldrb	r3, [r3]
 518 023e 5BB2     		sxtb	r3, r3
 519 0240 DB43     		mvns	r3, r3
 520 0242 5BB2     		sxtb	r3, r3
 521 0244 3A18     		adds	r2, r7, r0
 522 0246 1278     		ldrb	r2, [r2]
 523 0248 52B2     		sxtb	r2, r2
 524 024a 1340     		ands	r3, r2
 525 024c 5AB2     		sxtb	r2, r3
 526 024e 3B18     		adds	r3, r7, r0
 527 0250 1A70     		strb	r2, [r3]
 131:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->odrLow = c;
 528              		.loc 1 131 0
 529 0252 044A     		ldr	r2, .L20
 530 0254 3B18     		adds	r3, r7, r0
 531 0256 1B78     		ldrb	r3, [r3]
 532 0258 1375     		strb	r3, [r2, #20]
 132:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 533              		.loc 1 132 0
 534 025a C046     		nop
 535 025c BD46     		mov	sp, r7
 536 025e 04B0     		add	sp, sp, #16
 537              		@ sp needed
 538 0260 80BD     		pop	{r7, pc}
 539              	.L21:
 540 0262 C046     		.align	2
 541              	.L20:
 542 0264 00100240 		.word	1073876992
 543              		.cfi_endproc
 544              	.LFE6:
 546              		.align	1
 547              		.syntax unified
 548              		.code	16
 549              		.thumb_func
 550              		.fpu softvfp
 552              	select_controller:
 553              	.LFB7:
 133:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 134:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static void select_controller(uint8_t controller) {
 554              		.loc 1 134 0
 555              		.cfi_startproc
 556              		@ args = 0, pretend = 0, frame = 8
 557              		@ frame_needed = 1, uses_anonymous_args = 0
 558 0268 80B5     		push	{r7, lr}
 559              		.cfi_def_cfa_offset 8
 560              		.cfi_offset 7, -8
 561              		.cfi_offset 14, -4
 562 026a 82B0     		sub	sp, sp, #8
 563              		.cfi_def_cfa_offset 16
 564 026c 00AF     		add	r7, sp, #0
 565              		.cfi_def_cfa_register 7
 566 026e 0200     		movs	r2, r0
 567 0270 FB1D     		adds	r3, r7, #7
 568 0272 1A70     		strb	r2, [r3]
 135:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	switch(controller) {
 569              		.loc 1 135 0
 570 0274 FB1D     		adds	r3, r7, #7
 571 0276 1B78     		ldrb	r3, [r3]
 572 0278 082B     		cmp	r3, #8
 573 027a 0CD0     		beq	.L24
 574 027c 02DC     		bgt	.L25
 575 027e 002B     		cmp	r3, #0
 576 0280 05D0     		beq	.L26
 136:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case 0:
 137:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS1|B_CS2);
 138:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 139:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case B_CS1:
 140:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_set(B_CS1);
 141:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 142:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 143:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case B_CS2:
 144:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 145:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS1);
 146:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 147:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case B_CS1|B_CS2:
 148:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_set(B_CS1|B_CS2);
 149:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 150:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 151:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 577              		.loc 1 151 0
 578 0282 1AE0     		b	.L29
 579              	.L25:
 135:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	switch(controller) {
 580              		.loc 1 135 0
 581 0284 102B     		cmp	r3, #16
 582 0286 0DD0     		beq	.L27
 583 0288 182B     		cmp	r3, #24
 584 028a 12D0     		beq	.L28
 585              		.loc 1 151 0
 586 028c 15E0     		b	.L29
 587              	.L26:
 137:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 588              		.loc 1 137 0
 589 028e 1820     		movs	r0, #24
 590 0290 FFF7C2FF 		bl	graphic_ctrl_bit_clear
 138:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case B_CS1:
 591              		.loc 1 138 0
 592 0294 11E0     		b	.L23
 593              	.L24:
 140:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 594              		.loc 1 140 0
 595 0296 0820     		movs	r0, #8
 596 0298 FFF796FF 		bl	graphic_ctrl_bit_set
 141:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 597              		.loc 1 141 0
 598 029c 1020     		movs	r0, #16
 599 029e FFF7BBFF 		bl	graphic_ctrl_bit_clear
 142:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case B_CS2:
 600              		.loc 1 142 0
 601 02a2 0AE0     		b	.L23
 602              	.L27:
 144:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS1);
 603              		.loc 1 144 0
 604 02a4 1020     		movs	r0, #16
 605 02a6 FFF78FFF 		bl	graphic_ctrl_bit_set
 145:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 606              		.loc 1 145 0
 607 02aa 0820     		movs	r0, #8
 608 02ac FFF7B4FF 		bl	graphic_ctrl_bit_clear
 146:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case B_CS1|B_CS2:
 609              		.loc 1 146 0
 610 02b0 03E0     		b	.L23
 611              	.L28:
 148:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			break;
 612              		.loc 1 148 0
 613 02b2 1820     		movs	r0, #24
 614 02b4 FFF788FF 		bl	graphic_ctrl_bit_set
 149:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 615              		.loc 1 149 0
 616 02b8 C046     		nop
 617              	.L23:
 618              	.L29:
 619              		.loc 1 151 0
 620 02ba C046     		nop
 621 02bc BD46     		mov	sp, r7
 622 02be 02B0     		add	sp, sp, #8
 623              		@ sp needed
 624 02c0 80BD     		pop	{r7, pc}
 625              		.cfi_endproc
 626              	.LFE7:
 628              		.align	1
 629              		.syntax unified
 630              		.code	16
 631              		.thumb_func
 632              		.fpu softvfp
 634              	graphic_wait_ready:
 635              	.LFB8:
 152:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 153:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static void graphic_wait_ready(void) {
 636              		.loc 1 153 0
 637              		.cfi_startproc
 638              		@ args = 0, pretend = 0, frame = 8
 639              		@ frame_needed = 1, uses_anonymous_args = 0
 640 02c2 80B5     		push	{r7, lr}
 641              		.cfi_def_cfa_offset 8
 642              		.cfi_offset 7, -8
 643              		.cfi_offset 14, -4
 644 02c4 82B0     		sub	sp, sp, #8
 645              		.cfi_def_cfa_offset 16
 646 02c6 00AF     		add	r7, sp, #0
 647              		.cfi_def_cfa_register 7
 154:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t c;
 155:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 648              		.loc 1 155 0
 649 02c8 4020     		movs	r0, #64
 650 02ca FFF7A5FF 		bl	graphic_ctrl_bit_clear
 156:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->moder = 0x00005555;		// 15-8 inputs, 7-0 outputs
 651              		.loc 1 156 0
 652 02ce 144B     		ldr	r3, .L36
 653 02d0 144A     		ldr	r2, .L36+4
 654 02d2 1A60     		str	r2, [r3]
 157:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 655              		.loc 1 157 0
 656 02d4 0120     		movs	r0, #1
 657 02d6 FFF79FFF 		bl	graphic_ctrl_bit_clear
 158:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 658              		.loc 1 158 0
 659 02da 0220     		movs	r0, #2
 660 02dc FFF774FF 		bl	graphic_ctrl_bit_set
 159:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_500ns();
 661              		.loc 1 159 0
 662 02e0 FFF7FEFF 		bl	delay_500ns
 663              	.L33:
 160:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 161:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	while(1) {
 162:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_ctrl_bit_set(B_E);
 664              		.loc 1 162 0
 665 02e4 4020     		movs	r0, #64
 666 02e6 FFF76FFF 		bl	graphic_ctrl_bit_set
 163:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_500ns();
 667              		.loc 1 163 0
 668 02ea FFF7FEFF 		bl	delay_500ns
 164:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		c = GPIO_E->idrHigh & LCD_BUSY;
 669              		.loc 1 164 0
 670 02ee 0C4B     		ldr	r3, .L36
 671 02f0 5B7C     		ldrb	r3, [r3, #17]
 672 02f2 DAB2     		uxtb	r2, r3
 673 02f4 FB1D     		adds	r3, r7, #7
 674 02f6 7F21     		movs	r1, #127
 675 02f8 8A43     		bics	r2, r1
 676 02fa 1A70     		strb	r2, [r3]
 165:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 677              		.loc 1 165 0
 678 02fc 4020     		movs	r0, #64
 679 02fe FFF78BFF 		bl	graphic_ctrl_bit_clear
 166:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_500ns();
 680              		.loc 1 166 0
 681 0302 FFF7FEFF 		bl	delay_500ns
 167:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		if(c == 0) break;
 682              		.loc 1 167 0
 683 0306 FB1D     		adds	r3, r7, #7
 684 0308 1B78     		ldrb	r3, [r3]
 685 030a 002B     		cmp	r3, #0
 686 030c 00D0     		beq	.L35
 162:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_500ns();
 687              		.loc 1 162 0
 688 030e E9E7     		b	.L33
 689              	.L35:
 690              		.loc 1 167 0
 691 0310 C046     		nop
 168:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 169:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->moder = 0x55555555;	// 15-0 outputs
 692              		.loc 1 169 0
 693 0312 034B     		ldr	r3, .L36
 694 0314 044A     		ldr	r2, .L36+8
 695 0316 1A60     		str	r2, [r3]
 170:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 696              		.loc 1 170 0
 697 0318 C046     		nop
 698 031a BD46     		mov	sp, r7
 699 031c 02B0     		add	sp, sp, #8
 700              		@ sp needed
 701 031e 80BD     		pop	{r7, pc}
 702              	.L37:
 703              		.align	2
 704              	.L36:
 705 0320 00100240 		.word	1073876992
 706 0324 55550000 		.word	21845
 707 0328 55555555 		.word	1431655765
 708              		.cfi_endproc
 709              	.LFE8:
 711              		.align	1
 712              		.syntax unified
 713              		.code	16
 714              		.thumb_func
 715              		.fpu softvfp
 717              	graphic_read:
 718              	.LFB9:
 171:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 172:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static uint8_t graphic_read(uint8_t controller) {
 719              		.loc 1 172 0
 720              		.cfi_startproc
 721              		@ args = 0, pretend = 0, frame = 16
 722              		@ frame_needed = 1, uses_anonymous_args = 0
 723 032c 80B5     		push	{r7, lr}
 724              		.cfi_def_cfa_offset 8
 725              		.cfi_offset 7, -8
 726              		.cfi_offset 14, -4
 727 032e 84B0     		sub	sp, sp, #16
 728              		.cfi_def_cfa_offset 24
 729 0330 00AF     		add	r7, sp, #0
 730              		.cfi_def_cfa_register 7
 731 0332 0200     		movs	r2, r0
 732 0334 FB1D     		adds	r3, r7, #7
 733 0336 1A70     		strb	r2, [r3]
 173:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t c;
 174:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 734              		.loc 1 174 0
 735 0338 4020     		movs	r0, #64
 736 033a FFF76DFF 		bl	graphic_ctrl_bit_clear
 175:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->moder = 0x00005555;	// 15-8 inputs, 7-0 outputs
 737              		.loc 1 175 0
 738 033e 1C4B     		ldr	r3, .L42
 739 0340 1C4A     		ldr	r2, .L42+4
 740 0342 1A60     		str	r2, [r3]
 176:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RS|B_RW);
 741              		.loc 1 176 0
 742 0344 0320     		movs	r0, #3
 743 0346 FFF73FFF 		bl	graphic_ctrl_bit_set
 177:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	select_controller(controller);
 744              		.loc 1 177 0
 745 034a FB1D     		adds	r3, r7, #7
 746 034c 1B78     		ldrb	r3, [r3]
 747 034e 1800     		movs	r0, r3
 748 0350 FFF78AFF 		bl	select_controller
 178:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_500ns();
 749              		.loc 1 178 0
 750 0354 FFF7FEFF 		bl	delay_500ns
 179:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 751              		.loc 1 179 0
 752 0358 4020     		movs	r0, #64
 753 035a FFF735FF 		bl	graphic_ctrl_bit_set
 180:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_500ns();
 754              		.loc 1 180 0
 755 035e FFF7FEFF 		bl	delay_500ns
 181:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c = GPIO_E->idrHigh;
 756              		.loc 1 181 0
 757 0362 134A     		ldr	r2, .L42
 758 0364 0F23     		movs	r3, #15
 759 0366 FB18     		adds	r3, r7, r3
 760 0368 527C     		ldrb	r2, [r2, #17]
 761 036a 1A70     		strb	r2, [r3]
 182:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 762              		.loc 1 182 0
 763 036c 4020     		movs	r0, #64
 764 036e FFF753FF 		bl	graphic_ctrl_bit_clear
 183:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->moder = 0x55555555;	// 15-0 outputs
 765              		.loc 1 183 0
 766 0372 0F4B     		ldr	r3, .L42
 767 0374 104A     		ldr	r2, .L42+8
 768 0376 1A60     		str	r2, [r3]
 184:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 185:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(controller & B_CS1) {
 769              		.loc 1 185 0
 770 0378 FB1D     		adds	r3, r7, #7
 771 037a 1B78     		ldrb	r3, [r3]
 772 037c 0822     		movs	r2, #8
 773 037e 1340     		ands	r3, r2
 774 0380 04D0     		beq	.L39
 186:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		select_controller(B_CS1);
 775              		.loc 1 186 0
 776 0382 0820     		movs	r0, #8
 777 0384 FFF770FF 		bl	select_controller
 187:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_wait_ready();
 778              		.loc 1 187 0
 779 0388 FFF79BFF 		bl	graphic_wait_ready
 780              	.L39:
 188:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 189:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(controller & B_CS2) {
 781              		.loc 1 189 0
 782 038c FB1D     		adds	r3, r7, #7
 783 038e 1B78     		ldrb	r3, [r3]
 784 0390 1022     		movs	r2, #16
 785 0392 1340     		ands	r3, r2
 786 0394 04D0     		beq	.L40
 190:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		select_controller(B_CS2);
 787              		.loc 1 190 0
 788 0396 1020     		movs	r0, #16
 789 0398 FFF766FF 		bl	select_controller
 191:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_wait_ready();
 790              		.loc 1 191 0
 791 039c FFF791FF 		bl	graphic_wait_ready
 792              	.L40:
 192:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 193:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	return c;
 793              		.loc 1 193 0
 794 03a0 0F23     		movs	r3, #15
 795 03a2 FB18     		adds	r3, r7, r3
 796 03a4 1B78     		ldrb	r3, [r3]
 194:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 797              		.loc 1 194 0
 798 03a6 1800     		movs	r0, r3
 799 03a8 BD46     		mov	sp, r7
 800 03aa 04B0     		add	sp, sp, #16
 801              		@ sp needed
 802 03ac 80BD     		pop	{r7, pc}
 803              	.L43:
 804 03ae C046     		.align	2
 805              	.L42:
 806 03b0 00100240 		.word	1073876992
 807 03b4 55550000 		.word	21845
 808 03b8 55555555 		.word	1431655765
 809              		.cfi_endproc
 810              	.LFE9:
 812              		.align	1
 813              		.syntax unified
 814              		.code	16
 815              		.thumb_func
 816              		.fpu softvfp
 818              	graphic_read_data:
 819              	.LFB10:
 195:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 196:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static uint8_t graphic_read_data(uint8_t controller) {
 820              		.loc 1 196 0
 821              		.cfi_startproc
 822              		@ args = 0, pretend = 0, frame = 8
 823              		@ frame_needed = 1, uses_anonymous_args = 0
 824 03bc 80B5     		push	{r7, lr}
 825              		.cfi_def_cfa_offset 8
 826              		.cfi_offset 7, -8
 827              		.cfi_offset 14, -4
 828 03be 82B0     		sub	sp, sp, #8
 829              		.cfi_def_cfa_offset 16
 830 03c0 00AF     		add	r7, sp, #0
 831              		.cfi_def_cfa_register 7
 832 03c2 0200     		movs	r2, r0
 833 03c4 FB1D     		adds	r3, r7, #7
 834 03c6 1A70     		strb	r2, [r3]
 197:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_read(controller);
 835              		.loc 1 197 0
 836 03c8 FB1D     		adds	r3, r7, #7
 837 03ca 1B78     		ldrb	r3, [r3]
 838 03cc 1800     		movs	r0, r3
 839 03ce FFF7ADFF 		bl	graphic_read
 198:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	return graphic_read(controller);
 840              		.loc 1 198 0
 841 03d2 FB1D     		adds	r3, r7, #7
 842 03d4 1B78     		ldrb	r3, [r3]
 843 03d6 1800     		movs	r0, r3
 844 03d8 FFF7A8FF 		bl	graphic_read
 845 03dc 0300     		movs	r3, r0
 199:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 846              		.loc 1 199 0
 847 03de 1800     		movs	r0, r3
 848 03e0 BD46     		mov	sp, r7
 849 03e2 02B0     		add	sp, sp, #8
 850              		@ sp needed
 851 03e4 80BD     		pop	{r7, pc}
 852              		.cfi_endproc
 853              	.LFE10:
 855              		.align	1
 856              		.syntax unified
 857              		.code	16
 858              		.thumb_func
 859              		.fpu softvfp
 861              	graphic_write:
 862              	.LFB11:
 200:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 201:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static void graphic_write(uint8_t value, uint8_t controller) {
 863              		.loc 1 201 0
 864              		.cfi_startproc
 865              		@ args = 0, pretend = 0, frame = 8
 866              		@ frame_needed = 1, uses_anonymous_args = 0
 867 03e6 80B5     		push	{r7, lr}
 868              		.cfi_def_cfa_offset 8
 869              		.cfi_offset 7, -8
 870              		.cfi_offset 14, -4
 871 03e8 82B0     		sub	sp, sp, #8
 872              		.cfi_def_cfa_offset 16
 873 03ea 00AF     		add	r7, sp, #0
 874              		.cfi_def_cfa_register 7
 875 03ec 0200     		movs	r2, r0
 876 03ee FB1D     		adds	r3, r7, #7
 877 03f0 1A70     		strb	r2, [r3]
 878 03f2 BB1D     		adds	r3, r7, #6
 879 03f4 0A1C     		adds	r2, r1, #0
 880 03f6 1A70     		strb	r2, [r3]
 202:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->odrHigh = value;
 881              		.loc 1 202 0
 882 03f8 194A     		ldr	r2, .L49
 883 03fa FB1D     		adds	r3, r7, #7
 884 03fc 1B78     		ldrb	r3, [r3]
 885 03fe 5375     		strb	r3, [r2, #21]
 203:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	select_controller(controller);
 886              		.loc 1 203 0
 887 0400 BB1D     		adds	r3, r7, #6
 888 0402 1B78     		ldrb	r3, [r3]
 889 0404 1800     		movs	r0, r3
 890 0406 FFF72FFF 		bl	select_controller
 204:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_500ns();
 891              		.loc 1 204 0
 892 040a FFF7FEFF 		bl	delay_500ns
 205:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 893              		.loc 1 205 0
 894 040e 4020     		movs	r0, #64
 895 0410 FFF7DAFE 		bl	graphic_ctrl_bit_set
 206:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_500ns();
 896              		.loc 1 206 0
 897 0414 FFF7FEFF 		bl	delay_500ns
 207:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 898              		.loc 1 207 0
 899 0418 4020     		movs	r0, #64
 900 041a FFF7FDFE 		bl	graphic_ctrl_bit_clear
 208:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 209:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(controller & B_CS1) {
 901              		.loc 1 209 0
 902 041e BB1D     		adds	r3, r7, #6
 903 0420 1B78     		ldrb	r3, [r3]
 904 0422 0822     		movs	r2, #8
 905 0424 1340     		ands	r3, r2
 906 0426 04D0     		beq	.L47
 210:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		select_controller(B_CS1);
 907              		.loc 1 210 0
 908 0428 0820     		movs	r0, #8
 909 042a FFF71DFF 		bl	select_controller
 211:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_wait_ready();
 910              		.loc 1 211 0
 911 042e FFF748FF 		bl	graphic_wait_ready
 912              	.L47:
 212:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 213:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(controller & B_CS2) {
 913              		.loc 1 213 0
 914 0432 BB1D     		adds	r3, r7, #6
 915 0434 1B78     		ldrb	r3, [r3]
 916 0436 1022     		movs	r2, #16
 917 0438 1340     		ands	r3, r2
 918 043a 04D0     		beq	.L48
 214:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		select_controller(B_CS2);
 919              		.loc 1 214 0
 920 043c 1020     		movs	r0, #16
 921 043e FFF713FF 		bl	select_controller
 215:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_wait_ready();
 922              		.loc 1 215 0
 923 0442 FFF73EFF 		bl	graphic_wait_ready
 924              	.L48:
 216:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 217:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->odrHigh = 0;
 925              		.loc 1 217 0
 926 0446 064B     		ldr	r3, .L49
 927 0448 0022     		movs	r2, #0
 928 044a 5A75     		strb	r2, [r3, #21]
 218:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 929              		.loc 1 218 0
 930 044c 4020     		movs	r0, #64
 931 044e FFF7BBFE 		bl	graphic_ctrl_bit_set
 219:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	select_controller(0);
 932              		.loc 1 219 0
 933 0452 0020     		movs	r0, #0
 934 0454 FFF708FF 		bl	select_controller
 220:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 935              		.loc 1 220 0
 936 0458 C046     		nop
 937 045a BD46     		mov	sp, r7
 938 045c 02B0     		add	sp, sp, #8
 939              		@ sp needed
 940 045e 80BD     		pop	{r7, pc}
 941              	.L50:
 942              		.align	2
 943              	.L49:
 944 0460 00100240 		.word	1073876992
 945              		.cfi_endproc
 946              	.LFE11:
 948              		.align	1
 949              		.syntax unified
 950              		.code	16
 951              		.thumb_func
 952              		.fpu softvfp
 954              	graphic_write_command:
 955              	.LFB12:
 221:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 222:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static void graphic_write_command(uint8_t command, uint8_t controller) {
 956              		.loc 1 222 0
 957              		.cfi_startproc
 958              		@ args = 0, pretend = 0, frame = 8
 959              		@ frame_needed = 1, uses_anonymous_args = 0
 960 0464 80B5     		push	{r7, lr}
 961              		.cfi_def_cfa_offset 8
 962              		.cfi_offset 7, -8
 963              		.cfi_offset 14, -4
 964 0466 82B0     		sub	sp, sp, #8
 965              		.cfi_def_cfa_offset 16
 966 0468 00AF     		add	r7, sp, #0
 967              		.cfi_def_cfa_register 7
 968 046a 0200     		movs	r2, r0
 969 046c FB1D     		adds	r3, r7, #7
 970 046e 1A70     		strb	r2, [r3]
 971 0470 BB1D     		adds	r3, r7, #6
 972 0472 0A1C     		adds	r2, r1, #0
 973 0474 1A70     		strb	r2, [r3]
 223:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 974              		.loc 1 223 0
 975 0476 4020     		movs	r0, #64
 976 0478 FFF7CEFE 		bl	graphic_ctrl_bit_clear
 224:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	select_controller(controller);
 977              		.loc 1 224 0
 978 047c BB1D     		adds	r3, r7, #6
 979 047e 1B78     		ldrb	r3, [r3]
 980 0480 1800     		movs	r0, r3
 981 0482 FFF7F1FE 		bl	select_controller
 225:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_RS|B_RW);
 982              		.loc 1 225 0
 983 0486 0320     		movs	r0, #3
 984 0488 FFF7C6FE 		bl	graphic_ctrl_bit_clear
 226:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write(command, controller);
 985              		.loc 1 226 0
 986 048c BB1D     		adds	r3, r7, #6
 987 048e 1A78     		ldrb	r2, [r3]
 988 0490 FB1D     		adds	r3, r7, #7
 989 0492 1B78     		ldrb	r3, [r3]
 990 0494 1100     		movs	r1, r2
 991 0496 1800     		movs	r0, r3
 992 0498 FFF7A5FF 		bl	graphic_write
 227:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 993              		.loc 1 227 0
 994 049c C046     		nop
 995 049e BD46     		mov	sp, r7
 996 04a0 02B0     		add	sp, sp, #8
 997              		@ sp needed
 998 04a2 80BD     		pop	{r7, pc}
 999              		.cfi_endproc
 1000              	.LFE12:
 1002              		.align	1
 1003              		.syntax unified
 1004              		.code	16
 1005              		.thumb_func
 1006              		.fpu softvfp
 1008              	graphic_write_data:
 1009              	.LFB13:
 228:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 229:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** static void graphic_write_data(uint8_t data, uint8_t controller) {
 1010              		.loc 1 229 0
 1011              		.cfi_startproc
 1012              		@ args = 0, pretend = 0, frame = 8
 1013              		@ frame_needed = 1, uses_anonymous_args = 0
 1014 04a4 80B5     		push	{r7, lr}
 1015              		.cfi_def_cfa_offset 8
 1016              		.cfi_offset 7, -8
 1017              		.cfi_offset 14, -4
 1018 04a6 82B0     		sub	sp, sp, #8
 1019              		.cfi_def_cfa_offset 16
 1020 04a8 00AF     		add	r7, sp, #0
 1021              		.cfi_def_cfa_register 7
 1022 04aa 0200     		movs	r2, r0
 1023 04ac FB1D     		adds	r3, r7, #7
 1024 04ae 1A70     		strb	r2, [r3]
 1025 04b0 BB1D     		adds	r3, r7, #6
 1026 04b2 0A1C     		adds	r2, r1, #0
 1027 04b4 1A70     		strb	r2, [r3]
 230:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 1028              		.loc 1 230 0
 1029 04b6 4020     		movs	r0, #64
 1030 04b8 FFF7AEFE 		bl	graphic_ctrl_bit_clear
 231:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	select_controller(controller);
 1031              		.loc 1 231 0
 1032 04bc BB1D     		adds	r3, r7, #6
 1033 04be 1B78     		ldrb	r3, [r3]
 1034 04c0 1800     		movs	r0, r3
 1035 04c2 FFF7D1FE 		bl	select_controller
 232:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 1036              		.loc 1 232 0
 1037 04c6 0120     		movs	r0, #1
 1038 04c8 FFF77EFE 		bl	graphic_ctrl_bit_set
 233:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 1039              		.loc 1 233 0
 1040 04cc 0220     		movs	r0, #2
 1041 04ce FFF7A3FE 		bl	graphic_ctrl_bit_clear
 234:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write(data, controller);
 1042              		.loc 1 234 0
 1043 04d2 BB1D     		adds	r3, r7, #6
 1044 04d4 1A78     		ldrb	r2, [r3]
 1045 04d6 FB1D     		adds	r3, r7, #7
 1046 04d8 1B78     		ldrb	r3, [r3]
 1047 04da 1100     		movs	r1, r2
 1048 04dc 1800     		movs	r0, r3
 1049 04de FFF782FF 		bl	graphic_write
 235:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1050              		.loc 1 235 0
 1051 04e2 C046     		nop
 1052 04e4 BD46     		mov	sp, r7
 1053 04e6 02B0     		add	sp, sp, #8
 1054              		@ sp needed
 1055 04e8 80BD     		pop	{r7, pc}
 1056              		.cfi_endproc
 1057              	.LFE13:
 1059              		.align	1
 1060              		.global	graphic_clear_screen
 1061              		.syntax unified
 1062              		.code	16
 1063              		.thumb_func
 1064              		.fpu softvfp
 1066              	graphic_clear_screen:
 1067              	.LFB14:
 236:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 237:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void graphic_clear_screen(void) {
 1068              		.loc 1 237 0
 1069              		.cfi_startproc
 1070              		@ args = 0, pretend = 0, frame = 8
 1071              		@ frame_needed = 1, uses_anonymous_args = 0
 1072 04ea 80B5     		push	{r7, lr}
 1073              		.cfi_def_cfa_offset 8
 1074              		.cfi_offset 7, -8
 1075              		.cfi_offset 14, -4
 1076 04ec 82B0     		sub	sp, sp, #8
 1077              		.cfi_def_cfa_offset 16
 1078 04ee 00AF     		add	r7, sp, #0
 1079              		.cfi_def_cfa_register 7
 238:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t i, j;
 239:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 240:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(j = 0; j < 8; j++) {
 1080              		.loc 1 240 0
 1081 04f0 BB1D     		adds	r3, r7, #6
 1082 04f2 0022     		movs	r2, #0
 1083 04f4 1A70     		strb	r2, [r3]
 1084 04f6 23E0     		b	.L54
 1085              	.L57:
 241:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1086              		.loc 1 241 0
 1087 04f8 BB1D     		adds	r3, r7, #6
 1088 04fa 1B78     		ldrb	r3, [r3]
 1089 04fc 4822     		movs	r2, #72
 1090 04fe 5242     		rsbs	r2, r2, #0
 1091 0500 1343     		orrs	r3, r2
 1092 0502 DBB2     		uxtb	r3, r3
 1093 0504 1821     		movs	r1, #24
 1094 0506 1800     		movs	r0, r3
 1095 0508 FFF7ACFF 		bl	graphic_write_command
 242:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1096              		.loc 1 242 0
 1097 050c 1821     		movs	r1, #24
 1098 050e 4020     		movs	r0, #64
 1099 0510 FFF7A8FF 		bl	graphic_write_command
 243:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		for(i = 0; i <= 63; i++) {
 1100              		.loc 1 243 0
 1101 0514 FB1D     		adds	r3, r7, #7
 1102 0516 0022     		movs	r2, #0
 1103 0518 1A70     		strb	r2, [r3]
 1104 051a 08E0     		b	.L55
 1105              	.L56:
 244:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 1106              		.loc 1 244 0 discriminator 3
 1107 051c 1821     		movs	r1, #24
 1108 051e 0020     		movs	r0, #0
 1109 0520 FFF7C0FF 		bl	graphic_write_data
 243:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		for(i = 0; i <= 63; i++) {
 1110              		.loc 1 243 0 discriminator 3
 1111 0524 FB1D     		adds	r3, r7, #7
 1112 0526 1A78     		ldrb	r2, [r3]
 1113 0528 FB1D     		adds	r3, r7, #7
 1114 052a 0132     		adds	r2, r2, #1
 1115 052c 1A70     		strb	r2, [r3]
 1116              	.L55:
 243:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		for(i = 0; i <= 63; i++) {
 1117              		.loc 1 243 0 is_stmt 0 discriminator 1
 1118 052e FB1D     		adds	r3, r7, #7
 1119 0530 1B78     		ldrb	r3, [r3]
 1120 0532 3F2B     		cmp	r3, #63
 1121 0534 F2D9     		bls	.L56
 240:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1122              		.loc 1 240 0 is_stmt 1 discriminator 2
 1123 0536 BB1D     		adds	r3, r7, #6
 1124 0538 1A78     		ldrb	r2, [r3]
 1125 053a BB1D     		adds	r3, r7, #6
 1126 053c 0132     		adds	r2, r2, #1
 1127 053e 1A70     		strb	r2, [r3]
 1128              	.L54:
 240:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1129              		.loc 1 240 0 is_stmt 0 discriminator 1
 1130 0540 BB1D     		adds	r3, r7, #6
 1131 0542 1B78     		ldrb	r3, [r3]
 1132 0544 072B     		cmp	r3, #7
 1133 0546 D7D9     		bls	.L57
 245:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		}
 246:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 247:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1134              		.loc 1 247 0 is_stmt 1
 1135 0548 C046     		nop
 1136 054a BD46     		mov	sp, r7
 1137 054c 02B0     		add	sp, sp, #8
 1138              		@ sp needed
 1139 054e 80BD     		pop	{r7, pc}
 1140              		.cfi_endproc
 1141              	.LFE14:
 1143              		.align	1
 1144              		.global	graphic_initialize
 1145              		.syntax unified
 1146              		.code	16
 1147              		.thumb_func
 1148              		.fpu softvfp
 1150              	graphic_initialize:
 1151              	.LFB15:
 248:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 249:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void graphic_initialize(void) {
 1152              		.loc 1 249 0
 1153              		.cfi_startproc
 1154              		@ args = 0, pretend = 0, frame = 0
 1155              		@ frame_needed = 1, uses_anonymous_args = 0
 1156 0550 80B5     		push	{r7, lr}
 1157              		.cfi_def_cfa_offset 8
 1158              		.cfi_offset 7, -8
 1159              		.cfi_offset 14, -4
 1160 0552 00AF     		add	r7, sp, #0
 1161              		.cfi_def_cfa_register 7
 250:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 1162              		.loc 1 250 0
 1163 0554 4020     		movs	r0, #64
 1164 0556 FFF737FE 		bl	graphic_ctrl_bit_set
 251:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_micro(10);
 1165              		.loc 1 251 0
 1166 055a 0A20     		movs	r0, #10
 1167 055c FFF7FEFF 		bl	delay_micro
 252:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 1168              		.loc 1 252 0
 1169 0560 7820     		movs	r0, #120
 1170 0562 FFF759FE 		bl	graphic_ctrl_bit_clear
 253:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_milli(30);
 1171              		.loc 1 253 0
 1172 0566 1E20     		movs	r0, #30
 1173 0568 FFF7FEFF 		bl	delay_milli
 254:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 1174              		.loc 1 254 0
 1175 056c 2020     		movs	r0, #32
 1176 056e FFF72BFE 		bl	graphic_ctrl_bit_set
 255:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_milli(100);
 1177              		.loc 1 255 0
 1178 0572 6420     		movs	r0, #100
 1179 0574 FFF7FEFF 		bl	delay_milli
 256:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_OFF,			B_CS1|B_CS2);
 1180              		.loc 1 256 0
 1181 0578 1821     		movs	r1, #24
 1182 057a 3E20     		movs	r0, #62
 1183 057c FFF772FF 		bl	graphic_write_command
 257:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_ON,			B_CS1|B_CS2);
 1184              		.loc 1 257 0
 1185 0580 1821     		movs	r1, #24
 1186 0582 3F20     		movs	r0, #63
 1187 0584 FFF76EFF 		bl	graphic_write_command
 258:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_DISP_START,	B_CS1|B_CS2);
 1188              		.loc 1 258 0
 1189 0588 1821     		movs	r1, #24
 1190 058a C020     		movs	r0, #192
 1191 058c FFF76AFF 		bl	graphic_write_command
 259:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_ADD,		B_CS1|B_CS2);
 1192              		.loc 1 259 0
 1193 0590 1821     		movs	r1, #24
 1194 0592 4020     		movs	r0, #64
 1195 0594 FFF766FF 		bl	graphic_write_command
 260:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_PAGE,		B_CS1|B_CS2);
 1196              		.loc 1 260 0
 1197 0598 1821     		movs	r1, #24
 1198 059a B820     		movs	r0, #184
 1199 059c FFF762FF 		bl	graphic_write_command
 261:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	select_controller(0);
 1200              		.loc 1 261 0
 1201 05a0 0020     		movs	r0, #0
 1202 05a2 FFF761FE 		bl	select_controller
 262:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1203              		.loc 1 262 0
 1204 05a6 C046     		nop
 1205 05a8 BD46     		mov	sp, r7
 1206              		@ sp needed
 1207 05aa 80BD     		pop	{r7, pc}
 1208              		.cfi_endproc
 1209              	.LFE15:
 1211              		.align	1
 1212              		.global	pixel
 1213              		.syntax unified
 1214              		.code	16
 1215              		.thumb_func
 1216              		.fpu softvfp
 1218              	pixel:
 1219              	.LFB16:
 263:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 264:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void pixel(int x, int y, int set) {
 1220              		.loc 1 264 0
 1221              		.cfi_startproc
 1222              		@ args = 0, pretend = 0, frame = 32
 1223              		@ frame_needed = 1, uses_anonymous_args = 0
 1224 05ac B0B5     		push	{r4, r5, r7, lr}
 1225              		.cfi_def_cfa_offset 16
 1226              		.cfi_offset 4, -16
 1227              		.cfi_offset 5, -12
 1228              		.cfi_offset 7, -8
 1229              		.cfi_offset 14, -4
 1230 05ae 88B0     		sub	sp, sp, #32
 1231              		.cfi_def_cfa_offset 48
 1232 05b0 00AF     		add	r7, sp, #0
 1233              		.cfi_def_cfa_register 7
 1234 05b2 F860     		str	r0, [r7, #12]
 1235 05b4 B960     		str	r1, [r7, #8]
 1236 05b6 7A60     		str	r2, [r7, #4]
 265:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t mask, c, controller;
 266:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int index;
 267:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 268:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1237              		.loc 1 268 0
 1238 05b8 FB68     		ldr	r3, [r7, #12]
 1239 05ba 002B     		cmp	r3, #0
 1240 05bc 00DC     		bgt	.LCB1021
 1241 05be 8EE0     		b	.L70	@long jump
 1242              	.LCB1021:
 1243              		.loc 1 268 0 is_stmt 0 discriminator 1
 1244 05c0 BB68     		ldr	r3, [r7, #8]
 1245 05c2 002B     		cmp	r3, #0
 1246 05c4 00DC     		bgt	.LCB1024
 1247 05c6 8AE0     		b	.L70	@long jump
 1248              	.LCB1024:
 1249              		.loc 1 268 0 discriminator 2
 1250 05c8 FB68     		ldr	r3, [r7, #12]
 1251 05ca 802B     		cmp	r3, #128
 1252 05cc 00DD     		ble	.LCB1027
 1253 05ce 86E0     		b	.L70	@long jump
 1254              	.LCB1027:
 1255              		.loc 1 268 0 discriminator 3
 1256 05d0 BB68     		ldr	r3, [r7, #8]
 1257 05d2 402B     		cmp	r3, #64
 1258 05d4 00DD     		ble	.LCB1030
 1259 05d6 82E0     		b	.L70	@long jump
 1260              	.LCB1030:
 269:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 270:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	index = (y-1)/8;
 1261              		.loc 1 270 0 is_stmt 1
 1262 05d8 BB68     		ldr	r3, [r7, #8]
 1263 05da 013B     		subs	r3, r3, #1
 1264 05dc 002B     		cmp	r3, #0
 1265 05de 00DA     		bge	.L63
 1266 05e0 0733     		adds	r3, r3, #7
 1267              	.L63:
 1268 05e2 DB10     		asrs	r3, r3, #3
 1269 05e4 BB61     		str	r3, [r7, #24]
 271:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	mask = 1 << ((y - 1) % 8);
 1270              		.loc 1 271 0
 1271 05e6 BB68     		ldr	r3, [r7, #8]
 1272 05e8 013B     		subs	r3, r3, #1
 1273 05ea 3F4A     		ldr	r2, .L71
 1274 05ec 1340     		ands	r3, r2
 1275 05ee 04D5     		bpl	.L64
 1276 05f0 013B     		subs	r3, r3, #1
 1277 05f2 0822     		movs	r2, #8
 1278 05f4 5242     		rsbs	r2, r2, #0
 1279 05f6 1343     		orrs	r3, r2
 1280 05f8 0133     		adds	r3, r3, #1
 1281              	.L64:
 1282 05fa 1A00     		movs	r2, r3
 1283 05fc 0123     		movs	r3, #1
 1284 05fe 9340     		lsls	r3, r3, r2
 1285 0600 1A00     		movs	r2, r3
 1286 0602 1F23     		movs	r3, #31
 1287 0604 FB18     		adds	r3, r7, r3
 1288 0606 1A70     		strb	r2, [r3]
 272:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 273:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(set == 0)
 1289              		.loc 1 273 0
 1290 0608 7B68     		ldr	r3, [r7, #4]
 1291 060a 002B     		cmp	r3, #0
 1292 060c 05D1     		bne	.L65
 274:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		mask = ~mask;
 1293              		.loc 1 274 0
 1294 060e 1F22     		movs	r2, #31
 1295 0610 BB18     		adds	r3, r7, r2
 1296 0612 BA18     		adds	r2, r7, r2
 1297 0614 1278     		ldrb	r2, [r2]
 1298 0616 D243     		mvns	r2, r2
 1299 0618 1A70     		strb	r2, [r3]
 1300              	.L65:
 275:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		
 276:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(x > 64) {
 1301              		.loc 1 276 0
 1302 061a FB68     		ldr	r3, [r7, #12]
 1303 061c 402B     		cmp	r3, #64
 1304 061e 07DD     		ble	.L66
 277:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		controller = B_CS2;
 1305              		.loc 1 277 0
 1306 0620 1E23     		movs	r3, #30
 1307 0622 FB18     		adds	r3, r7, r3
 1308 0624 1022     		movs	r2, #16
 1309 0626 1A70     		strb	r2, [r3]
 278:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		x = x - 65;
 1310              		.loc 1 278 0
 1311 0628 FB68     		ldr	r3, [r7, #12]
 1312 062a 413B     		subs	r3, r3, #65
 1313 062c FB60     		str	r3, [r7, #12]
 1314 062e 06E0     		b	.L67
 1315              	.L66:
 279:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	} else {
 280:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		controller = B_CS1;
 1316              		.loc 1 280 0
 1317 0630 1E23     		movs	r3, #30
 1318 0632 FB18     		adds	r3, r7, r3
 1319 0634 0822     		movs	r2, #8
 1320 0636 1A70     		strb	r2, [r3]
 281:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		x = x - 1;
 1321              		.loc 1 281 0
 1322 0638 FB68     		ldr	r3, [r7, #12]
 1323 063a 013B     		subs	r3, r3, #1
 1324 063c FB60     		str	r3, [r7, #12]
 1325              	.L67:
 282:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 283:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 284:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_ADD	| x, controller);
 1326              		.loc 1 284 0
 1327 063e FB68     		ldr	r3, [r7, #12]
 1328 0640 5BB2     		sxtb	r3, r3
 1329 0642 4022     		movs	r2, #64
 1330 0644 1343     		orrs	r3, r2
 1331 0646 5BB2     		sxtb	r3, r3
 1332 0648 DAB2     		uxtb	r2, r3
 1333 064a 1E25     		movs	r5, #30
 1334 064c 7B19     		adds	r3, r7, r5
 1335 064e 1B78     		ldrb	r3, [r3]
 1336 0650 1900     		movs	r1, r3
 1337 0652 1000     		movs	r0, r2
 1338 0654 FFF706FF 		bl	graphic_write_command
 285:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_PAGE	| index, controller);
 1339              		.loc 1 285 0
 1340 0658 BB69     		ldr	r3, [r7, #24]
 1341 065a 5BB2     		sxtb	r3, r3
 1342 065c 4822     		movs	r2, #72
 1343 065e 5242     		rsbs	r2, r2, #0
 1344 0660 1343     		orrs	r3, r2
 1345 0662 5BB2     		sxtb	r3, r3
 1346 0664 DAB2     		uxtb	r2, r3
 1347 0666 7B19     		adds	r3, r7, r5
 1348 0668 1B78     		ldrb	r3, [r3]
 1349 066a 1900     		movs	r1, r3
 1350 066c 1000     		movs	r0, r2
 1351 066e FFF7F9FE 		bl	graphic_write_command
 286:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c = graphic_read_data(controller);
 1352              		.loc 1 286 0
 1353 0672 1723     		movs	r3, #23
 1354 0674 FC18     		adds	r4, r7, r3
 1355 0676 7B19     		adds	r3, r7, r5
 1356 0678 1B78     		ldrb	r3, [r3]
 1357 067a 1800     		movs	r0, r3
 1358 067c FFF79EFE 		bl	graphic_read_data
 1359 0680 0300     		movs	r3, r0
 1360 0682 2370     		strb	r3, [r4]
 287:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_ADD	| x, controller);
 1361              		.loc 1 287 0
 1362 0684 FB68     		ldr	r3, [r7, #12]
 1363 0686 5BB2     		sxtb	r3, r3
 1364 0688 4022     		movs	r2, #64
 1365 068a 1343     		orrs	r3, r2
 1366 068c 5BB2     		sxtb	r3, r3
 1367 068e DAB2     		uxtb	r2, r3
 1368 0690 7B19     		adds	r3, r7, r5
 1369 0692 1B78     		ldrb	r3, [r3]
 1370 0694 1900     		movs	r1, r3
 1371 0696 1000     		movs	r0, r2
 1372 0698 FFF7E4FE 		bl	graphic_write_command
 288:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 289:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(set)
 1373              		.loc 1 289 0
 1374 069c 7B68     		ldr	r3, [r7, #4]
 1375 069e 002B     		cmp	r3, #0
 1376 06a0 09D0     		beq	.L68
 290:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		mask = mask | c;
 1377              		.loc 1 290 0
 1378 06a2 1F22     		movs	r2, #31
 1379 06a4 BB18     		adds	r3, r7, r2
 1380 06a6 B918     		adds	r1, r7, r2
 1381 06a8 1722     		movs	r2, #23
 1382 06aa BA18     		adds	r2, r7, r2
 1383 06ac 0978     		ldrb	r1, [r1]
 1384 06ae 1278     		ldrb	r2, [r2]
 1385 06b0 0A43     		orrs	r2, r1
 1386 06b2 1A70     		strb	r2, [r3]
 1387 06b4 08E0     		b	.L69
 1388              	.L68:
 291:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	else
 292:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		mask = mask & c;
 1389              		.loc 1 292 0
 1390 06b6 1F22     		movs	r2, #31
 1391 06b8 BB18     		adds	r3, r7, r2
 1392 06ba BA18     		adds	r2, r7, r2
 1393 06bc 1721     		movs	r1, #23
 1394 06be 7918     		adds	r1, r7, r1
 1395 06c0 1278     		ldrb	r2, [r2]
 1396 06c2 0978     		ldrb	r1, [r1]
 1397 06c4 0A40     		ands	r2, r1
 1398 06c6 1A70     		strb	r2, [r3]
 1399              	.L69:
 293:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		
 294:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_write_data(mask, controller);
 1400              		.loc 1 294 0
 1401 06c8 1E23     		movs	r3, #30
 1402 06ca FB18     		adds	r3, r7, r3
 1403 06cc 1A78     		ldrb	r2, [r3]
 1404 06ce 1F23     		movs	r3, #31
 1405 06d0 FB18     		adds	r3, r7, r3
 1406 06d2 1B78     		ldrb	r3, [r3]
 1407 06d4 1100     		movs	r1, r2
 1408 06d6 1800     		movs	r0, r3
 1409 06d8 FFF7E4FE 		bl	graphic_write_data
 1410 06dc 00E0     		b	.L59
 1411              	.L70:
 268:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 1412              		.loc 1 268 0
 1413 06de C046     		nop
 1414              	.L59:
 295:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1415              		.loc 1 295 0
 1416 06e0 BD46     		mov	sp, r7
 1417 06e2 08B0     		add	sp, sp, #32
 1418              		@ sp needed
 1419 06e4 B0BD     		pop	{r4, r5, r7, pc}
 1420              	.L72:
 1421 06e6 C046     		.align	2
 1422              	.L71:
 1423 06e8 07000080 		.word	-2147483641
 1424              		.cfi_endproc
 1425              	.LFE16:
 1427              		.align	1
 1428              		.global	delay_250ns
 1429              		.syntax unified
 1430              		.code	16
 1431              		.thumb_func
 1432              		.fpu softvfp
 1434              	delay_250ns:
 1435              	.LFB17:
 296:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 297:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_250ns(void) {
 1436              		.loc 1 297 0
 1437              		.cfi_startproc
 1438              		@ args = 0, pretend = 0, frame = 0
 1439              		@ frame_needed = 1, uses_anonymous_args = 0
 1440 06ec 80B5     		push	{r7, lr}
 1441              		.cfi_def_cfa_offset 8
 1442              		.cfi_offset 7, -8
 1443              		.cfi_offset 14, -4
 1444 06ee 00AF     		add	r7, sp, #0
 1445              		.cfi_def_cfa_register 7
 298:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_CTRL = 0;				// clear SysTik
 1446              		.loc 1 298 0
 1447 06f0 0C4B     		ldr	r3, .L75
 1448 06f2 0022     		movs	r2, #0
 1449 06f4 1A60     		str	r2, [r3]
 299:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_LOAD = 41;				// initialize with 42 cycles
 1450              		.loc 1 299 0
 1451 06f6 0C4B     		ldr	r3, .L75+4
 1452 06f8 2922     		movs	r2, #41
 1453 06fa 1A60     		str	r2, [r3]
 300:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_VAL = 0;				// clear countregister
 1454              		.loc 1 300 0
 1455 06fc 0B4B     		ldr	r3, .L75+8
 1456 06fe 0022     		movs	r2, #0
 1457 0700 1A60     		str	r2, [r3]
 301:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_CTRL = 5;				// reset counter
 1458              		.loc 1 301 0
 1459 0702 084B     		ldr	r3, .L75
 1460 0704 0522     		movs	r2, #5
 1461 0706 1A60     		str	r2, [r3]
 302:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	while ((*STK_CTRL & 0x00010000) == 0) {}	// wait until COUNTFLAG = 1
 1462              		.loc 1 302 0
 1463 0708 C046     		nop
 1464              	.L74:
 1465              		.loc 1 302 0 is_stmt 0 discriminator 1
 1466 070a 064B     		ldr	r3, .L75
 1467 070c 1A68     		ldr	r2, [r3]
 1468 070e 8023     		movs	r3, #128
 1469 0710 5B02     		lsls	r3, r3, #9
 1470 0712 1340     		ands	r3, r2
 1471 0714 F9D0     		beq	.L74
 303:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_CTRL = 0;				// clear SysTik
 1472              		.loc 1 303 0 is_stmt 1
 1473 0716 034B     		ldr	r3, .L75
 1474 0718 0022     		movs	r2, #0
 1475 071a 1A60     		str	r2, [r3]
 304:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1476              		.loc 1 304 0
 1477 071c C046     		nop
 1478 071e BD46     		mov	sp, r7
 1479              		@ sp needed
 1480 0720 80BD     		pop	{r7, pc}
 1481              	.L76:
 1482 0722 C046     		.align	2
 1483              	.L75:
 1484 0724 10E000E0 		.word	-536813552
 1485 0728 14E000E0 		.word	-536813548
 1486 072c 18E000E0 		.word	-536813544
 1487              		.cfi_endproc
 1488              	.LFE17:
 1490              		.align	1
 1491              		.global	delay_500ns
 1492              		.syntax unified
 1493              		.code	16
 1494              		.thumb_func
 1495              		.fpu softvfp
 1497              	delay_500ns:
 1498              	.LFB18:
 305:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 306:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_500ns(void) {
 1499              		.loc 1 306 0
 1500              		.cfi_startproc
 1501              		@ args = 0, pretend = 0, frame = 0
 1502              		@ frame_needed = 1, uses_anonymous_args = 0
 1503 0730 80B5     		push	{r7, lr}
 1504              		.cfi_def_cfa_offset 8
 1505              		.cfi_offset 7, -8
 1506              		.cfi_offset 14, -4
 1507 0732 00AF     		add	r7, sp, #0
 1508              		.cfi_def_cfa_register 7
 307:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_250ns();
 1509              		.loc 1 307 0
 1510 0734 FFF7FEFF 		bl	delay_250ns
 308:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_250ns();
 1511              		.loc 1 308 0
 1512 0738 FFF7FEFF 		bl	delay_250ns
 309:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1513              		.loc 1 309 0
 1514 073c C046     		nop
 1515 073e BD46     		mov	sp, r7
 1516              		@ sp needed
 1517 0740 80BD     		pop	{r7, pc}
 1518              		.cfi_endproc
 1519              	.LFE18:
 1521              		.align	1
 1522              		.global	delay_micro
 1523              		.syntax unified
 1524              		.code	16
 1525              		.thumb_func
 1526              		.fpu softvfp
 1528              	delay_micro:
 1529              	.LFB19:
 310:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 311:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_micro(unsigned int us) {
 1530              		.loc 1 311 0
 1531              		.cfi_startproc
 1532              		@ args = 0, pretend = 0, frame = 8
 1533              		@ frame_needed = 1, uses_anonymous_args = 0
 1534 0742 80B5     		push	{r7, lr}
 1535              		.cfi_def_cfa_offset 8
 1536              		.cfi_offset 7, -8
 1537              		.cfi_offset 14, -4
 1538 0744 82B0     		sub	sp, sp, #8
 1539              		.cfi_def_cfa_offset 16
 1540 0746 00AF     		add	r7, sp, #0
 1541              		.cfi_def_cfa_register 7
 1542 0748 7860     		str	r0, [r7, #4]
 312:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	while(us--) {
 1543              		.loc 1 312 0
 1544 074a 07E0     		b	.L79
 1545              	.L80:
 313:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 1546              		.loc 1 313 0
 1547 074c FFF7FEFF 		bl	delay_250ns
 314:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 1548              		.loc 1 314 0
 1549 0750 FFF7FEFF 		bl	delay_250ns
 315:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 1550              		.loc 1 315 0
 1551 0754 FFF7FEFF 		bl	delay_250ns
 316:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 1552              		.loc 1 316 0
 1553 0758 FFF7FEFF 		bl	delay_250ns
 1554              	.L79:
 312:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 1555              		.loc 1 312 0
 1556 075c 7B68     		ldr	r3, [r7, #4]
 1557 075e 5A1E     		subs	r2, r3, #1
 1558 0760 7A60     		str	r2, [r7, #4]
 1559 0762 002B     		cmp	r3, #0
 1560 0764 F2D1     		bne	.L80
 317:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	} 
 318:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1561              		.loc 1 318 0
 1562 0766 C046     		nop
 1563 0768 BD46     		mov	sp, r7
 1564 076a 02B0     		add	sp, sp, #8
 1565              		@ sp needed
 1566 076c 80BD     		pop	{r7, pc}
 1567              		.cfi_endproc
 1568              	.LFE19:
 1570              		.align	1
 1571              		.global	delay_milli
 1572              		.syntax unified
 1573              		.code	16
 1574              		.thumb_func
 1575              		.fpu softvfp
 1577              	delay_milli:
 1578              	.LFB20:
 319:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 320:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_milli(unsigned int ms) {
 1579              		.loc 1 320 0
 1580              		.cfi_startproc
 1581              		@ args = 0, pretend = 0, frame = 8
 1582              		@ frame_needed = 1, uses_anonymous_args = 0
 1583 076e 80B5     		push	{r7, lr}
 1584              		.cfi_def_cfa_offset 8
 1585              		.cfi_offset 7, -8
 1586              		.cfi_offset 14, -4
 1587 0770 82B0     		sub	sp, sp, #8
 1588              		.cfi_def_cfa_offset 16
 1589 0772 00AF     		add	r7, sp, #0
 1590              		.cfi_def_cfa_register 7
 1591 0774 7860     		str	r0, [r7, #4]
 321:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //	#ifdef SIMULATOR
 322:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		while( ms-- )
 1592              		.loc 1 322 0
 1593 0776 02E0     		b	.L82
 1594              	.L83:
 323:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			delay_micro(1);
 1595              		.loc 1 323 0
 1596 0778 0120     		movs	r0, #1
 1597 077a FFF7FEFF 		bl	delay_micro
 1598              	.L82:
 322:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			delay_micro(1);
 1599              		.loc 1 322 0
 1600 077e 7B68     		ldr	r3, [r7, #4]
 1601 0780 5A1E     		subs	r2, r3, #1
 1602 0782 7A60     		str	r2, [r7, #4]
 1603 0784 002B     		cmp	r3, #0
 1604 0786 F7D1     		bne	.L83
 324:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //	#else
 325:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //		while( ms-- )
 326:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //			delay_micro(1000);
 327:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //	#endif
 328:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1605              		.loc 1 328 0
 1606 0788 C046     		nop
 1607 078a BD46     		mov	sp, r7
 1608 078c 02B0     		add	sp, sp, #8
 1609              		@ sp needed
 1610 078e 80BD     		pop	{r7, pc}
 1611              		.cfi_endproc
 1612              	.LFE20:
 1614              		.align	1
 1615              		.global	init_app
 1616              		.syntax unified
 1617              		.code	16
 1618              		.thumb_func
 1619              		.fpu softvfp
 1621              	init_app:
 1622              	.LFB21:
 329:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 330:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void init_app(void) {
 1623              		.loc 1 330 0
 1624              		.cfi_startproc
 1625              		@ args = 0, pretend = 0, frame = 0
 1626              		@ frame_needed = 1, uses_anonymous_args = 0
 1627 0790 80B5     		push	{r7, lr}
 1628              		.cfi_def_cfa_offset 8
 1629              		.cfi_offset 7, -8
 1630              		.cfi_offset 14, -4
 1631 0792 00AF     		add	r7, sp, #0
 1632              		.cfi_def_cfa_register 7
 331:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->moder = 0x55555555;		// 15-0 outport
 1633              		.loc 1 331 0
 1634 0794 024B     		ldr	r3, .L85
 1635 0796 034A     		ldr	r2, .L85+4
 1636 0798 1A60     		str	r2, [r3]
 332:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 1637              		.loc 1 332 0
 1638 079a C046     		nop
 1639 079c BD46     		mov	sp, r7
 1640              		@ sp needed
 1641 079e 80BD     		pop	{r7, pc}
 1642              	.L86:
 1643              		.align	2
 1644              	.L85:
 1645 07a0 00100240 		.word	1073876992
 1646 07a4 55555555 		.word	1431655765
 1647              		.cfi_endproc
 1648              	.LFE21:
 1650              		.global	ball_geometry
 1651              		.data
 1652              		.align	2
 1655              	ball_geometry:
 1656 0000 0C000000 		.word	12
 1657 0004 04000000 		.word	4
 1658 0008 04000000 		.word	4
 1659 000c 00       		.byte	0
 1660 000d 01       		.byte	1
 1661 000e 00       		.byte	0
 1662 000f 02       		.byte	2
 1663 0010 01       		.byte	1
 1664 0011 00       		.byte	0
 1665 0012 01       		.byte	1
 1666 0013 01       		.byte	1
 1667 0014 01       		.byte	1
 1668 0015 02       		.byte	2
 1669 0016 01       		.byte	1
 1670 0017 03       		.byte	3
 1671 0018 02       		.byte	2
 1672 0019 00       		.byte	0
 1673 001a 02       		.byte	2
 1674 001b 01       		.byte	1
 1675 001c 02       		.byte	2
 1676 001d 02       		.byte	2
 1677 001e 02       		.byte	2
 1678 001f 03       		.byte	3
 1679 0020 03       		.byte	3
 1680 0021 01       		.byte	1
 1681 0022 03       		.byte	3
 1682 0023 02       		.byte	2
 1683 0024 00000000 		.space	16
 1683      00000000 
 1683      00000000 
 1683      00000000 
 1684              		.global	ball
 1685              		.align	2
 1688              	ball:
 1689 0034 00000000 		.word	ball_geometry
 1690 0038 00000000 		.word	0
 1691 003c 00000000 		.word	0
 1692 0040 01000000 		.word	1
 1693 0044 01000000 		.word	1
 1694 0048 00000000 		.word	draw_object
 1695 004c 00000000 		.word	clear_object
 1696 0050 00000000 		.word	move_object
 1697 0054 00000000 		.word	set_object_speed
 1698              		.text
 1699              		.align	1
 1700              		.global	main
 1701              		.syntax unified
 1702              		.code	16
 1703              		.thumb_func
 1704              		.fpu softvfp
 1706              	main:
 1707              	.LFB22:
 333:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 334:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** GEOMETRY ball_geometry =
 335:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** {
 336:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	12,
 337:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	4,4,
 338:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	{
 339:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		{0,1}, {0,2}, {1,0}, {1,1}, {1,2},
 340:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		{1,3}, {2,0}, {2,1}, {2,2}, {2,3},
 341:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		{3,1}, {3,2}
 342:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 343:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** };
 344:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 345:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** OBJECT ball =
 346:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** {
 347:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	&ball_geometry,
 348:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	0,0,
 349:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	1,1,
 350:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	draw_object,
 351:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	clear_object,
 352:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	move_object,
 353:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	set_object_speed
 354:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** };
 355:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 356:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void main(void) {	
 1708              		.loc 1 356 0
 1709              		.cfi_startproc
 1710              		@ args = 0, pretend = 0, frame = 8
 1711              		@ frame_needed = 1, uses_anonymous_args = 0
 1712 07a8 80B5     		push	{r7, lr}
 1713              		.cfi_def_cfa_offset 8
 1714              		.cfi_offset 7, -8
 1715              		.cfi_offset 14, -4
 1716 07aa 82B0     		sub	sp, sp, #8
 1717              		.cfi_def_cfa_offset 16
 1718 07ac 00AF     		add	r7, sp, #0
 1719              		.cfi_def_cfa_register 7
 357:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	POBJECT p = &ball;
 1720              		.loc 1 357 0
 1721 07ae 0A4B     		ldr	r3, .L89
 1722 07b0 7B60     		str	r3, [r7, #4]
 358:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	init_app();
 1723              		.loc 1 358 0
 1724 07b2 FFF7FEFF 		bl	init_app
 359:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_initialize();
 1725              		.loc 1 359 0
 1726 07b6 FFF7FEFF 		bl	graphic_initialize
 360:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #ifndef SIMULATOR
 361:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	//graphic_clear_screen();
 362:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #endif
 363:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	p->set_speed(p, 4, 1);
 1727              		.loc 1 363 0
 1728 07ba 7B68     		ldr	r3, [r7, #4]
 1729 07bc 1B6A     		ldr	r3, [r3, #32]
 1730 07be 7868     		ldr	r0, [r7, #4]
 1731 07c0 0122     		movs	r2, #1
 1732 07c2 0421     		movs	r1, #4
 1733 07c4 9847     		blx	r3
 1734              	.LVL0:
 1735              	.L88:
 364:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	while(1) {
 365:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		p->move(p);
 1736              		.loc 1 365 0 discriminator 1
 1737 07c6 7B68     		ldr	r3, [r7, #4]
 1738 07c8 DB69     		ldr	r3, [r3, #28]
 1739 07ca 7A68     		ldr	r2, [r7, #4]
 1740 07cc 1000     		movs	r0, r2
 1741 07ce 9847     		blx	r3
 1742              	.LVL1:
 366:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_milli(40);
 1743              		.loc 1 366 0 discriminator 1
 1744 07d0 2820     		movs	r0, #40
 1745 07d2 FFF7FEFF 		bl	delay_milli
 365:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_milli(40);
 1746              		.loc 1 365 0 discriminator 1
 1747 07d6 F6E7     		b	.L88
 1748              	.L90:
 1749              		.align	2
 1750              	.L89:
 1751 07d8 00000000 		.word	ball
 1752              		.cfi_endproc
 1753              	.LFE22:
 1755              	.Letext0:
 1756              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1757              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
