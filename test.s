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
  25              		.file 1 "C:/Users/johan/Documents/Git/Orm/startup.c"
   1:C:/Users/johan/Documents/Git/Orm\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   2:C:/Users/johan/Documents/Git/Orm\startup.c **** 
   3:C:/Users/johan/Documents/Git/Orm\startup.c **** void startup ( void )
   4:C:/Users/johan/Documents/Git/Orm\startup.c **** {
  26              		.loc 1 4 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   5:C:/Users/johan/Documents/Git/Orm\startup.c **** __asm volatile(
  31              		.loc 1 5 0
  32              		.syntax divided
  33              	@ 5 "C:/Users/johan/Documents/Git/Orm/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
   6:C:/Users/johan/Documents/Git/Orm\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
   7:C:/Users/johan/Documents/Git/Orm\startup.c **** 	" MOV SP,R0\n"
   8:C:/Users/johan/Documents/Git/Orm\startup.c **** 	" BL main\n"				/* call main */
   9:C:/Users/johan/Documents/Git/Orm\startup.c **** 	"_exit: B .\n"				/* never return */
  10:C:/Users/johan/Documents/Git/Orm\startup.c **** 	) ;
  11:C:/Users/johan/Documents/Git/Orm\startup.c **** }
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
  12:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  13:C:/Users/johan/Documents/Git/Orm\startup.c **** // Typedefs
  14:C:/Users/johan/Documents/Git/Orm\startup.c **** typedef unsigned int	uint32_t;
  15:C:/Users/johan/Documents/Git/Orm\startup.c **** typedef unsigned short	uint16_t;
  16:C:/Users/johan/Documents/Git/Orm\startup.c **** typedef unsigned char	uint8_t;
  17:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  18:C:/Users/johan/Documents/Git/Orm\startup.c **** // SysTick
  19:C:/Users/johan/Documents/Git/Orm\startup.c **** #define STK_BASE		0xE000E010
  20:C:/Users/johan/Documents/Git/Orm\startup.c **** #define STK_CTRL		((volatile unsigned int*) (STK_BASE))
  21:C:/Users/johan/Documents/Git/Orm\startup.c **** #define STK_LOAD		((volatile unsigned int*) (STK_BASE+0x4))
  22:C:/Users/johan/Documents/Git/Orm\startup.c **** #define STK_VAL			((volatile unsigned int*) (STK_BASE+0x8))
  23:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  24:C:/Users/johan/Documents/Git/Orm\startup.c **** #define PORT_DISPLAY_BASE 0x40021000 // MD407 port E
  25:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portModer ((volatile unsigned int *) (PORT_DISPLAY_BASE))
  26:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portOtyper ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x4))
  27:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portOspeedr ((volatile unsigned int *) (PORT_DISPLAY_BASE+0x8))
  28:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portPupdr ((volatile unsigned int *) (PORT_DISPLAY_BASE+0xC))
  29:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portIdr ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x10))
  30:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portIdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE+0x11))
  31:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portOdrLow ((volatile unsigned char *) (PORT_DISPLAY_BASE+0x14))
  32:C:/Users/johan/Documents/Git/Orm\startup.c **** #define portOdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE+0x14+1))
  33:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  34:C:/Users/johan/Documents/Git/Orm\startup.c **** /* Definiera bitar för de olika bitarna i styrregistret */
  35:C:/Users/johan/Documents/Git/Orm\startup.c **** #define B_RS			0x01
  36:C:/Users/johan/Documents/Git/Orm\startup.c **** #define B_RW			0x02
  37:C:/Users/johan/Documents/Git/Orm\startup.c **** #define B_SELECT		0x04
  38:C:/Users/johan/Documents/Git/Orm\startup.c **** #define B_CS1			0x08
  39:C:/Users/johan/Documents/Git/Orm\startup.c **** #define B_CS2			0x10
  40:C:/Users/johan/Documents/Git/Orm\startup.c **** #define B_RST			0x20
  41:C:/Users/johan/Documents/Git/Orm\startup.c **** #define B_E				0x40
  42:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  43:C:/Users/johan/Documents/Git/Orm\startup.c **** // Definition av kommandon till display, sänds via dataregister.
  44:C:/Users/johan/Documents/Git/Orm\startup.c **** #define LCD_ON 			0x3F // Display on
  45:C:/Users/johan/Documents/Git/Orm\startup.c **** #define LCD_OFF 		0x3E // Display off
  46:C:/Users/johan/Documents/Git/Orm\startup.c **** #define LCD_SET_ADD 	0x40 // Set horizontal coordinate
  47:C:/Users/johan/Documents/Git/Orm\startup.c **** #define LCD_SET_PAGE 	0xB8 // Set vertical coordinate
  48:C:/Users/johan/Documents/Git/Orm\startup.c **** #define LCD_DISP_START 	0xC0 // Start address
  49:C:/Users/johan/Documents/Git/Orm\startup.c **** #define LCD_BUSY 		0x80 // Read busy status
  50:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  51:C:/Users/johan/Documents/Git/Orm\startup.c **** #define MAX_POINTS		20
  52:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  53:C:/Users/johan/Documents/Git/Orm\startup.c **** typedef struct tPoint {
  54:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t x;
  55:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t y;
  56:C:/Users/johan/Documents/Git/Orm\startup.c **** } POINT;
  57:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  58:C:/Users/johan/Documents/Git/Orm\startup.c **** typedef struct tGeometry {
  59:C:/Users/johan/Documents/Git/Orm\startup.c **** 	int numpoints;
  60:C:/Users/johan/Documents/Git/Orm\startup.c **** 	int sizex;
  61:C:/Users/johan/Documents/Git/Orm\startup.c **** 	int sizey;
  62:C:/Users/johan/Documents/Git/Orm\startup.c **** 	POINT px[MAX_POINTS];
  63:C:/Users/johan/Documents/Git/Orm\startup.c **** } GEOMETRY, *PGEOMETRY;
  64:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  65:C:/Users/johan/Documents/Git/Orm\startup.c **** typedef struct tObj {
  66:C:/Users/johan/Documents/Git/Orm\startup.c **** 	PGEOMETRY geo;
  67:C:/Users/johan/Documents/Git/Orm\startup.c **** 	int dirx, diry;
  68:C:/Users/johan/Documents/Git/Orm\startup.c **** 	int posx, posy;
  69:C:/Users/johan/Documents/Git/Orm\startup.c **** 	void (*draw)(struct tObj*);
  70:C:/Users/johan/Documents/Git/Orm\startup.c **** 	void (*clear)(struct tObj*);
  71:C:/Users/johan/Documents/Git/Orm\startup.c **** 	void (*move)(struct tObj*);
  72:C:/Users/johan/Documents/Git/Orm\startup.c **** 	void (*set_speed)(struct tObj*, int, int);
  73:C:/Users/johan/Documents/Git/Orm\startup.c **** } OBJECT, *POBJECT;
  74:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  75:C:/Users/johan/Documents/Git/Orm\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy) {
  57              		.loc 1 75 0
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
  76:C:/Users/johan/Documents/Git/Orm\startup.c **** 	o->dirx = speedx;
  72              		.loc 1 76 0
  73 000c FB68     		ldr	r3, [r7, #12]
  74 000e BA68     		ldr	r2, [r7, #8]
  75 0010 5A60     		str	r2, [r3, #4]
  77:C:/Users/johan/Documents/Git/Orm\startup.c **** 	o->diry = speedy;
  76              		.loc 1 77 0
  77 0012 FB68     		ldr	r3, [r7, #12]
  78 0014 7A68     		ldr	r2, [r7, #4]
  79 0016 9A60     		str	r2, [r3, #8]
  78:C:/Users/johan/Documents/Git/Orm\startup.c **** }
  80              		.loc 1 78 0
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
  79:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  80:C:/Users/johan/Documents/Git/Orm\startup.c **** void draw_object(POBJECT o) {
  98              		.loc 1 80 0
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
  81:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 112              		.loc 1 81 0
 113 0028 0023     		movs	r3, #0
 114 002a FB60     		str	r3, [r7, #12]
 115 002c 17E0     		b	.L4
 116              	.L5:
 117              	.LBB3:
  82:C:/Users/johan/Documents/Git/Orm\startup.c **** 		pixel(o->geo->px[i].x, o->geo->px[i].y, 1);
 118              		.loc 1 82 0 discriminator 3
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
  81:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 140              		.loc 1 81 0 discriminator 3
 141 0058 FB68     		ldr	r3, [r7, #12]
 142 005a 0133     		adds	r3, r3, #1
 143 005c FB60     		str	r3, [r7, #12]
 144              	.L4:
  81:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 145              		.loc 1 81 0 is_stmt 0 discriminator 1
 146 005e 7B68     		ldr	r3, [r7, #4]
 147 0060 1B68     		ldr	r3, [r3]
 148 0062 1B68     		ldr	r3, [r3]
 149 0064 FA68     		ldr	r2, [r7, #12]
 150 0066 9A42     		cmp	r2, r3
 151 0068 E1DB     		blt	.L5
 152              	.LBE2:
  83:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
  84:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 153              		.loc 1 84 0 is_stmt 1
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
  85:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  86:C:/Users/johan/Documents/Git/Orm\startup.c **** void clear_object(POBJECT o) {
 171              		.loc 1 86 0
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
  87:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 185              		.loc 1 87 0
 186 007a 0023     		movs	r3, #0
 187 007c FB60     		str	r3, [r7, #12]
 188 007e 17E0     		b	.L7
 189              	.L8:
 190              	.LBB5:
  88:C:/Users/johan/Documents/Git/Orm\startup.c **** 		pixel(o->geo->px[i].x, o->geo->px[i].y, 0);
 191              		.loc 1 88 0 discriminator 3
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
  87:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 213              		.loc 1 87 0 discriminator 3
 214 00aa FB68     		ldr	r3, [r7, #12]
 215 00ac 0133     		adds	r3, r3, #1
 216 00ae FB60     		str	r3, [r7, #12]
 217              	.L7:
  87:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 218              		.loc 1 87 0 is_stmt 0 discriminator 1
 219 00b0 7B68     		ldr	r3, [r7, #4]
 220 00b2 1B68     		ldr	r3, [r3]
 221 00b4 1B68     		ldr	r3, [r3]
 222 00b6 FA68     		ldr	r2, [r7, #12]
 223 00b8 9A42     		cmp	r2, r3
 224 00ba E1DB     		blt	.L8
 225              	.LBE4:
  89:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
  90:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 226              		.loc 1 90 0 is_stmt 1
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
  91:C:/Users/johan/Documents/Git/Orm\startup.c **** 
  92:C:/Users/johan/Documents/Git/Orm\startup.c **** void move_object(POBJECT o) {
 244              		.loc 1 92 0
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
  93:C:/Users/johan/Documents/Git/Orm\startup.c **** 	clear_object(o);
 257              		.loc 1 93 0
 258 00cc 7B68     		ldr	r3, [r7, #4]
 259 00ce 1800     		movs	r0, r3
 260 00d0 FFF7FEFF 		bl	clear_object
 261              	.LBB6:
  94:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
  95:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 262              		.loc 1 95 0
 263 00d4 0023     		movs	r3, #0
 264 00d6 FB60     		str	r3, [r7, #12]
 265 00d8 2EE0     		b	.L10
 266              	.L11:
  96:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 267              		.loc 1 96 0 discriminator 3
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
  97:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->geo->px[i].y += o->diry;
 290              		.loc 1 97 0 discriminator 3
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
  95:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 313              		.loc 1 95 0 discriminator 3
 314 0132 FB68     		ldr	r3, [r7, #12]
 315 0134 0133     		adds	r3, r3, #1
 316 0136 FB60     		str	r3, [r7, #12]
 317              	.L10:
  95:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 318              		.loc 1 95 0 is_stmt 0 discriminator 1
 319 0138 7B68     		ldr	r3, [r7, #4]
 320 013a 1B68     		ldr	r3, [r3]
 321 013c 1B68     		ldr	r3, [r3]
 322 013e FA68     		ldr	r2, [r7, #12]
 323 0140 9A42     		cmp	r2, r3
 324 0142 CADB     		blt	.L11
 325              	.LBE6:
  98:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
  99:C:/Users/johan/Documents/Git/Orm\startup.c **** 	o->posx += o->dirx;
 326              		.loc 1 99 0 is_stmt 1
 327 0144 7B68     		ldr	r3, [r7, #4]
 328 0146 DA68     		ldr	r2, [r3, #12]
 329 0148 7B68     		ldr	r3, [r7, #4]
 330 014a 5B68     		ldr	r3, [r3, #4]
 331 014c D218     		adds	r2, r2, r3
 332 014e 7B68     		ldr	r3, [r7, #4]
 333 0150 DA60     		str	r2, [r3, #12]
 100:C:/Users/johan/Documents/Git/Orm\startup.c **** 	o->posy += o->diry;
 334              		.loc 1 100 0
 335 0152 7B68     		ldr	r3, [r7, #4]
 336 0154 1A69     		ldr	r2, [r3, #16]
 337 0156 7B68     		ldr	r3, [r7, #4]
 338 0158 9B68     		ldr	r3, [r3, #8]
 339 015a D218     		adds	r2, r2, r3
 340 015c 7B68     		ldr	r3, [r7, #4]
 341 015e 1A61     		str	r2, [r3, #16]
 101:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 102:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(o->posx < 1)
 342              		.loc 1 102 0
 343 0160 7B68     		ldr	r3, [r7, #4]
 344 0162 DB68     		ldr	r3, [r3, #12]
 345 0164 002B     		cmp	r3, #0
 346 0166 04DC     		bgt	.L12
 103:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->dirx *= -1;
 347              		.loc 1 103 0
 348 0168 7B68     		ldr	r3, [r7, #4]
 349 016a 5B68     		ldr	r3, [r3, #4]
 350 016c 5A42     		rsbs	r2, r3, #0
 351 016e 7B68     		ldr	r3, [r7, #4]
 352 0170 5A60     		str	r2, [r3, #4]
 353              	.L12:
 104:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if((o->posx + o->geo->sizex) > 128)
 354              		.loc 1 104 0
 355 0172 7B68     		ldr	r3, [r7, #4]
 356 0174 DA68     		ldr	r2, [r3, #12]
 357 0176 7B68     		ldr	r3, [r7, #4]
 358 0178 1B68     		ldr	r3, [r3]
 359 017a 5B68     		ldr	r3, [r3, #4]
 360 017c D318     		adds	r3, r2, r3
 361 017e 802B     		cmp	r3, #128
 362 0180 04DD     		ble	.L13
 105:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->dirx *= -1;
 363              		.loc 1 105 0
 364 0182 7B68     		ldr	r3, [r7, #4]
 365 0184 5B68     		ldr	r3, [r3, #4]
 366 0186 5A42     		rsbs	r2, r3, #0
 367 0188 7B68     		ldr	r3, [r7, #4]
 368 018a 5A60     		str	r2, [r3, #4]
 369              	.L13:
 106:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(o->posy < 1)
 370              		.loc 1 106 0
 371 018c 7B68     		ldr	r3, [r7, #4]
 372 018e 1B69     		ldr	r3, [r3, #16]
 373 0190 002B     		cmp	r3, #0
 374 0192 04DC     		bgt	.L14
 107:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->diry *= -1;
 375              		.loc 1 107 0
 376 0194 7B68     		ldr	r3, [r7, #4]
 377 0196 9B68     		ldr	r3, [r3, #8]
 378 0198 5A42     		rsbs	r2, r3, #0
 379 019a 7B68     		ldr	r3, [r7, #4]
 380 019c 9A60     		str	r2, [r3, #8]
 381              	.L14:
 108:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if((o->posy + o->geo->sizey) > 64)
 382              		.loc 1 108 0
 383 019e 7B68     		ldr	r3, [r7, #4]
 384 01a0 1A69     		ldr	r2, [r3, #16]
 385 01a2 7B68     		ldr	r3, [r7, #4]
 386 01a4 1B68     		ldr	r3, [r3]
 387 01a6 9B68     		ldr	r3, [r3, #8]
 388 01a8 D318     		adds	r3, r2, r3
 389 01aa 402B     		cmp	r3, #64
 390 01ac 04DD     		ble	.L15
 109:C:/Users/johan/Documents/Git/Orm\startup.c **** 		o->diry *= -1;
 391              		.loc 1 109 0
 392 01ae 7B68     		ldr	r3, [r7, #4]
 393 01b0 9B68     		ldr	r3, [r3, #8]
 394 01b2 5A42     		rsbs	r2, r3, #0
 395 01b4 7B68     		ldr	r3, [r7, #4]
 396 01b6 9A60     		str	r2, [r3, #8]
 397              	.L15:
 110:C:/Users/johan/Documents/Git/Orm\startup.c **** 		
 111:C:/Users/johan/Documents/Git/Orm\startup.c **** 	draw_object(o);
 398              		.loc 1 111 0
 399 01b8 7B68     		ldr	r3, [r7, #4]
 400 01ba 1800     		movs	r0, r3
 401 01bc FFF7FEFF 		bl	draw_object
 112:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 402              		.loc 1 112 0
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
 113:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 114:C:/Users/johan/Documents/Git/Orm\startup.c **** static void graphic_ctrl_bit_set(uint8_t x) {
 419              		.loc 1 114 0
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
 115:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t c;
 116:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c = *portOdrLow;
 434              		.loc 1 116 0
 435 01d4 0F4A     		ldr	r2, .L17
 436 01d6 0F20     		movs	r0, #15
 437 01d8 3B18     		adds	r3, r7, r0
 438 01da 1278     		ldrb	r2, [r2]
 439 01dc 1A70     		strb	r2, [r3]
 117:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c &= ~B_SELECT;
 440              		.loc 1 117 0
 441 01de 3B18     		adds	r3, r7, r0
 442 01e0 3A18     		adds	r2, r7, r0
 443 01e2 1278     		ldrb	r2, [r2]
 444 01e4 0421     		movs	r1, #4
 445 01e6 8A43     		bics	r2, r1
 446 01e8 1A70     		strb	r2, [r3]
 118:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c |= (~B_SELECT & x);
 447              		.loc 1 118 0
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
 119:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portOdrLow = c;
 461              		.loc 1 119 0
 462 0204 034A     		ldr	r2, .L17
 463 0206 3B18     		adds	r3, r7, r0
 464 0208 1B78     		ldrb	r3, [r3]
 465 020a 1370     		strb	r3, [r2]
 120:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 466              		.loc 1 120 0
 467 020c C046     		nop
 468 020e BD46     		mov	sp, r7
 469 0210 04B0     		add	sp, sp, #16
 470              		@ sp needed
 471 0212 80BD     		pop	{r7, pc}
 472              	.L18:
 473              		.align	2
 474              	.L17:
 475 0214 14100240 		.word	1073877012
 476              		.cfi_endproc
 477              	.LFE5:
 479              		.align	1
 480              		.syntax unified
 481              		.code	16
 482              		.thumb_func
 483              		.fpu softvfp
 485              	graphic_ctrl_bit_clear:
 486              	.LFB6:
 121:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 122:C:/Users/johan/Documents/Git/Orm\startup.c **** static void graphic_ctrl_bit_clear(uint8_t x) {
 487              		.loc 1 122 0
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
 123:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t c;
 124:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c = *portOdrLow;
 502              		.loc 1 124 0
 503 0224 0F4A     		ldr	r2, .L20
 504 0226 0F20     		movs	r0, #15
 505 0228 3B18     		adds	r3, r7, r0
 506 022a 1278     		ldrb	r2, [r2]
 507 022c 1A70     		strb	r2, [r3]
 125:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c &= ~B_SELECT;
 508              		.loc 1 125 0
 509 022e 3B18     		adds	r3, r7, r0
 510 0230 3A18     		adds	r2, r7, r0
 511 0232 1278     		ldrb	r2, [r2]
 512 0234 0421     		movs	r1, #4
 513 0236 8A43     		bics	r2, r1
 514 0238 1A70     		strb	r2, [r3]
 126:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c &= ~x;
 515              		.loc 1 126 0
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
 127:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portOdrLow = c;
 528              		.loc 1 127 0
 529 0252 044A     		ldr	r2, .L20
 530 0254 3B18     		adds	r3, r7, r0
 531 0256 1B78     		ldrb	r3, [r3]
 532 0258 1370     		strb	r3, [r2]
 128:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 533              		.loc 1 128 0
 534 025a C046     		nop
 535 025c BD46     		mov	sp, r7
 536 025e 04B0     		add	sp, sp, #16
 537              		@ sp needed
 538 0260 80BD     		pop	{r7, pc}
 539              	.L21:
 540 0262 C046     		.align	2
 541              	.L20:
 542 0264 14100240 		.word	1073877012
 543              		.cfi_endproc
 544              	.LFE6:
 546              		.align	1
 547              		.syntax unified
 548              		.code	16
 549              		.thumb_func
 550              		.fpu softvfp
 552              	select_controller:
 553              	.LFB7:
 129:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 130:C:/Users/johan/Documents/Git/Orm\startup.c **** static void select_controller(uint8_t controller) {
 554              		.loc 1 130 0
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
 131:C:/Users/johan/Documents/Git/Orm\startup.c **** 	switch(controller) {
 569              		.loc 1 131 0
 570 0274 FB1D     		adds	r3, r7, #7
 571 0276 1B78     		ldrb	r3, [r3]
 572 0278 082B     		cmp	r3, #8
 573 027a 0CD0     		beq	.L24
 574 027c 02DC     		bgt	.L25
 575 027e 002B     		cmp	r3, #0
 576 0280 05D0     		beq	.L26
 132:C:/Users/johan/Documents/Git/Orm\startup.c **** 		case 0:
 133:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS1|B_CS2);
 134:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 135:C:/Users/johan/Documents/Git/Orm\startup.c **** 		case B_CS1:
 136:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_set(B_CS1);
 137:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 138:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 139:C:/Users/johan/Documents/Git/Orm\startup.c **** 		case B_CS2:
 140:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 141:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS1);
 142:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 143:C:/Users/johan/Documents/Git/Orm\startup.c **** 		case B_CS1|B_CS2:
 144:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_set(B_CS1|B_CS2);
 145:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 146:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 147:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 577              		.loc 1 147 0
 578 0282 1AE0     		b	.L29
 579              	.L25:
 131:C:/Users/johan/Documents/Git/Orm\startup.c **** 	switch(controller) {
 580              		.loc 1 131 0
 581 0284 102B     		cmp	r3, #16
 582 0286 0DD0     		beq	.L27
 583 0288 182B     		cmp	r3, #24
 584 028a 12D0     		beq	.L28
 585              		.loc 1 147 0
 586 028c 15E0     		b	.L29
 587              	.L26:
 133:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 588              		.loc 1 133 0
 589 028e 1820     		movs	r0, #24
 590 0290 FFF7C2FF 		bl	graphic_ctrl_bit_clear
 134:C:/Users/johan/Documents/Git/Orm\startup.c **** 		case B_CS1:
 591              		.loc 1 134 0
 592 0294 11E0     		b	.L23
 593              	.L24:
 136:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 594              		.loc 1 136 0
 595 0296 0820     		movs	r0, #8
 596 0298 FFF796FF 		bl	graphic_ctrl_bit_set
 137:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 597              		.loc 1 137 0
 598 029c 1020     		movs	r0, #16
 599 029e FFF7BBFF 		bl	graphic_ctrl_bit_clear
 138:C:/Users/johan/Documents/Git/Orm\startup.c **** 		case B_CS2:
 600              		.loc 1 138 0
 601 02a2 0AE0     		b	.L23
 602              	.L27:
 140:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_ctrl_bit_clear(B_CS1);
 603              		.loc 1 140 0
 604 02a4 1020     		movs	r0, #16
 605 02a6 FFF78FFF 		bl	graphic_ctrl_bit_set
 141:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 606              		.loc 1 141 0
 607 02aa 0820     		movs	r0, #8
 608 02ac FFF7B4FF 		bl	graphic_ctrl_bit_clear
 142:C:/Users/johan/Documents/Git/Orm\startup.c **** 		case B_CS1|B_CS2:
 609              		.loc 1 142 0
 610 02b0 03E0     		b	.L23
 611              	.L28:
 144:C:/Users/johan/Documents/Git/Orm\startup.c **** 			break;
 612              		.loc 1 144 0
 613 02b2 1820     		movs	r0, #24
 614 02b4 FFF788FF 		bl	graphic_ctrl_bit_set
 145:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 615              		.loc 1 145 0
 616 02b8 C046     		nop
 617              	.L23:
 618              	.L29:
 619              		.loc 1 147 0
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
 148:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 149:C:/Users/johan/Documents/Git/Orm\startup.c **** static void graphic_wait_ready(void) {
 636              		.loc 1 149 0
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
 150:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t c;
 151:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 648              		.loc 1 151 0
 649 02c8 4020     		movs	r0, #64
 650 02ca FFF7A5FF 		bl	graphic_ctrl_bit_clear
 152:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portModer = 0x00005555;	// 15-8 inputs, 7-0 outputs
 651              		.loc 1 152 0
 652 02ce 144B     		ldr	r3, .L36
 653 02d0 144A     		ldr	r2, .L36+4
 654 02d2 1A60     		str	r2, [r3]
 153:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 655              		.loc 1 153 0
 656 02d4 0120     		movs	r0, #1
 657 02d6 FFF79FFF 		bl	graphic_ctrl_bit_clear
 154:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 658              		.loc 1 154 0
 659 02da 0220     		movs	r0, #2
 660 02dc FFF774FF 		bl	graphic_ctrl_bit_set
 155:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_500ns();
 661              		.loc 1 155 0
 662 02e0 FFF7FEFF 		bl	delay_500ns
 663              	.L33:
 156:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 157:C:/Users/johan/Documents/Git/Orm\startup.c **** 	while(1) {
 158:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_ctrl_bit_set(B_E);
 664              		.loc 1 158 0
 665 02e4 4020     		movs	r0, #64
 666 02e6 FFF76FFF 		bl	graphic_ctrl_bit_set
 159:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_500ns();
 667              		.loc 1 159 0
 668 02ea FFF7FEFF 		bl	delay_500ns
 160:C:/Users/johan/Documents/Git/Orm\startup.c **** 		c = *portIdrHigh & LCD_BUSY;
 669              		.loc 1 160 0
 670 02ee 0E4B     		ldr	r3, .L36+8
 671 02f0 1B78     		ldrb	r3, [r3]
 672 02f2 DAB2     		uxtb	r2, r3
 673 02f4 FB1D     		adds	r3, r7, #7
 674 02f6 7F21     		movs	r1, #127
 675 02f8 8A43     		bics	r2, r1
 676 02fa 1A70     		strb	r2, [r3]
 161:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 677              		.loc 1 161 0
 678 02fc 4020     		movs	r0, #64
 679 02fe FFF78BFF 		bl	graphic_ctrl_bit_clear
 162:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_500ns();
 680              		.loc 1 162 0
 681 0302 FFF7FEFF 		bl	delay_500ns
 163:C:/Users/johan/Documents/Git/Orm\startup.c **** 		if(c == 0) break;
 682              		.loc 1 163 0
 683 0306 FB1D     		adds	r3, r7, #7
 684 0308 1B78     		ldrb	r3, [r3]
 685 030a 002B     		cmp	r3, #0
 686 030c 00D0     		beq	.L35
 158:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_500ns();
 687              		.loc 1 158 0
 688 030e E9E7     		b	.L33
 689              	.L35:
 690              		.loc 1 163 0
 691 0310 C046     		nop
 164:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 165:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portModer = 0x55555555;	// 15-0 outputs
 692              		.loc 1 165 0
 693 0312 034B     		ldr	r3, .L36
 694 0314 054A     		ldr	r2, .L36+12
 695 0316 1A60     		str	r2, [r3]
 166:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 696              		.loc 1 166 0
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
 707 0328 11100240 		.word	1073877009
 708 032c 55555555 		.word	1431655765
 709              		.cfi_endproc
 710              	.LFE8:
 712              		.align	1
 713              		.syntax unified
 714              		.code	16
 715              		.thumb_func
 716              		.fpu softvfp
 718              	graphic_read:
 719              	.LFB9:
 167:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 168:C:/Users/johan/Documents/Git/Orm\startup.c **** static uint8_t graphic_read(uint8_t controller) {
 720              		.loc 1 168 0
 721              		.cfi_startproc
 722              		@ args = 0, pretend = 0, frame = 16
 723              		@ frame_needed = 1, uses_anonymous_args = 0
 724 0330 80B5     		push	{r7, lr}
 725              		.cfi_def_cfa_offset 8
 726              		.cfi_offset 7, -8
 727              		.cfi_offset 14, -4
 728 0332 84B0     		sub	sp, sp, #16
 729              		.cfi_def_cfa_offset 24
 730 0334 00AF     		add	r7, sp, #0
 731              		.cfi_def_cfa_register 7
 732 0336 0200     		movs	r2, r0
 733 0338 FB1D     		adds	r3, r7, #7
 734 033a 1A70     		strb	r2, [r3]
 169:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t c;
 170:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 735              		.loc 1 170 0
 736 033c 4020     		movs	r0, #64
 737 033e FFF76BFF 		bl	graphic_ctrl_bit_clear
 171:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portModer = 0x00005555;	// 15-8 inputs, 7-0 outputs
 738              		.loc 1 171 0
 739 0342 1C4B     		ldr	r3, .L42
 740 0344 1C4A     		ldr	r2, .L42+4
 741 0346 1A60     		str	r2, [r3]
 172:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RS|B_RW);
 742              		.loc 1 172 0
 743 0348 0320     		movs	r0, #3
 744 034a FFF73DFF 		bl	graphic_ctrl_bit_set
 173:C:/Users/johan/Documents/Git/Orm\startup.c **** 	select_controller(controller);
 745              		.loc 1 173 0
 746 034e FB1D     		adds	r3, r7, #7
 747 0350 1B78     		ldrb	r3, [r3]
 748 0352 1800     		movs	r0, r3
 749 0354 FFF788FF 		bl	select_controller
 174:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_500ns();
 750              		.loc 1 174 0
 751 0358 FFF7FEFF 		bl	delay_500ns
 175:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 752              		.loc 1 175 0
 753 035c 4020     		movs	r0, #64
 754 035e FFF733FF 		bl	graphic_ctrl_bit_set
 176:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_500ns();
 755              		.loc 1 176 0
 756 0362 FFF7FEFF 		bl	delay_500ns
 177:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c = *portIdrHigh;
 757              		.loc 1 177 0
 758 0366 154A     		ldr	r2, .L42+8
 759 0368 0F23     		movs	r3, #15
 760 036a FB18     		adds	r3, r7, r3
 761 036c 1278     		ldrb	r2, [r2]
 762 036e 1A70     		strb	r2, [r3]
 178:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 763              		.loc 1 178 0
 764 0370 4020     		movs	r0, #64
 765 0372 FFF751FF 		bl	graphic_ctrl_bit_clear
 179:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portModer = 0x55555555;	// 15-0 outputs
 766              		.loc 1 179 0
 767 0376 0F4B     		ldr	r3, .L42
 768 0378 114A     		ldr	r2, .L42+12
 769 037a 1A60     		str	r2, [r3]
 180:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 181:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(controller & B_CS1) {
 770              		.loc 1 181 0
 771 037c FB1D     		adds	r3, r7, #7
 772 037e 1B78     		ldrb	r3, [r3]
 773 0380 0822     		movs	r2, #8
 774 0382 1340     		ands	r3, r2
 775 0384 04D0     		beq	.L39
 182:C:/Users/johan/Documents/Git/Orm\startup.c **** 		select_controller(B_CS1);
 776              		.loc 1 182 0
 777 0386 0820     		movs	r0, #8
 778 0388 FFF76EFF 		bl	select_controller
 183:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_wait_ready();
 779              		.loc 1 183 0
 780 038c FFF799FF 		bl	graphic_wait_ready
 781              	.L39:
 184:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 185:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(controller & B_CS2) {
 782              		.loc 1 185 0
 783 0390 FB1D     		adds	r3, r7, #7
 784 0392 1B78     		ldrb	r3, [r3]
 785 0394 1022     		movs	r2, #16
 786 0396 1340     		ands	r3, r2
 787 0398 04D0     		beq	.L40
 186:C:/Users/johan/Documents/Git/Orm\startup.c **** 		select_controller(B_CS2);
 788              		.loc 1 186 0
 789 039a 1020     		movs	r0, #16
 790 039c FFF764FF 		bl	select_controller
 187:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_wait_ready();
 791              		.loc 1 187 0
 792 03a0 FFF78FFF 		bl	graphic_wait_ready
 793              	.L40:
 188:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 189:C:/Users/johan/Documents/Git/Orm\startup.c **** 	return c;
 794              		.loc 1 189 0
 795 03a4 0F23     		movs	r3, #15
 796 03a6 FB18     		adds	r3, r7, r3
 797 03a8 1B78     		ldrb	r3, [r3]
 190:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 798              		.loc 1 190 0
 799 03aa 1800     		movs	r0, r3
 800 03ac BD46     		mov	sp, r7
 801 03ae 04B0     		add	sp, sp, #16
 802              		@ sp needed
 803 03b0 80BD     		pop	{r7, pc}
 804              	.L43:
 805 03b2 C046     		.align	2
 806              	.L42:
 807 03b4 00100240 		.word	1073876992
 808 03b8 55550000 		.word	21845
 809 03bc 11100240 		.word	1073877009
 810 03c0 55555555 		.word	1431655765
 811              		.cfi_endproc
 812              	.LFE9:
 814              		.align	1
 815              		.syntax unified
 816              		.code	16
 817              		.thumb_func
 818              		.fpu softvfp
 820              	graphic_read_data:
 821              	.LFB10:
 191:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 192:C:/Users/johan/Documents/Git/Orm\startup.c **** static uint8_t graphic_read_data(uint8_t controller) {
 822              		.loc 1 192 0
 823              		.cfi_startproc
 824              		@ args = 0, pretend = 0, frame = 8
 825              		@ frame_needed = 1, uses_anonymous_args = 0
 826 03c4 80B5     		push	{r7, lr}
 827              		.cfi_def_cfa_offset 8
 828              		.cfi_offset 7, -8
 829              		.cfi_offset 14, -4
 830 03c6 82B0     		sub	sp, sp, #8
 831              		.cfi_def_cfa_offset 16
 832 03c8 00AF     		add	r7, sp, #0
 833              		.cfi_def_cfa_register 7
 834 03ca 0200     		movs	r2, r0
 835 03cc FB1D     		adds	r3, r7, #7
 836 03ce 1A70     		strb	r2, [r3]
 193:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_read(controller);
 837              		.loc 1 193 0
 838 03d0 FB1D     		adds	r3, r7, #7
 839 03d2 1B78     		ldrb	r3, [r3]
 840 03d4 1800     		movs	r0, r3
 841 03d6 FFF7ABFF 		bl	graphic_read
 194:C:/Users/johan/Documents/Git/Orm\startup.c **** 	return graphic_read(controller);
 842              		.loc 1 194 0
 843 03da FB1D     		adds	r3, r7, #7
 844 03dc 1B78     		ldrb	r3, [r3]
 845 03de 1800     		movs	r0, r3
 846 03e0 FFF7A6FF 		bl	graphic_read
 847 03e4 0300     		movs	r3, r0
 195:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 848              		.loc 1 195 0
 849 03e6 1800     		movs	r0, r3
 850 03e8 BD46     		mov	sp, r7
 851 03ea 02B0     		add	sp, sp, #8
 852              		@ sp needed
 853 03ec 80BD     		pop	{r7, pc}
 854              		.cfi_endproc
 855              	.LFE10:
 857              		.align	1
 858              		.syntax unified
 859              		.code	16
 860              		.thumb_func
 861              		.fpu softvfp
 863              	graphic_write:
 864              	.LFB11:
 196:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 197:C:/Users/johan/Documents/Git/Orm\startup.c **** static void graphic_write(uint8_t value, uint8_t controller) {
 865              		.loc 1 197 0
 866              		.cfi_startproc
 867              		@ args = 0, pretend = 0, frame = 8
 868              		@ frame_needed = 1, uses_anonymous_args = 0
 869 03ee 80B5     		push	{r7, lr}
 870              		.cfi_def_cfa_offset 8
 871              		.cfi_offset 7, -8
 872              		.cfi_offset 14, -4
 873 03f0 82B0     		sub	sp, sp, #8
 874              		.cfi_def_cfa_offset 16
 875 03f2 00AF     		add	r7, sp, #0
 876              		.cfi_def_cfa_register 7
 877 03f4 0200     		movs	r2, r0
 878 03f6 FB1D     		adds	r3, r7, #7
 879 03f8 1A70     		strb	r2, [r3]
 880 03fa BB1D     		adds	r3, r7, #6
 881 03fc 0A1C     		adds	r2, r1, #0
 882 03fe 1A70     		strb	r2, [r3]
 198:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portOdrHigh = value;
 883              		.loc 1 198 0
 884 0400 194A     		ldr	r2, .L49
 885 0402 FB1D     		adds	r3, r7, #7
 886 0404 1B78     		ldrb	r3, [r3]
 887 0406 1370     		strb	r3, [r2]
 199:C:/Users/johan/Documents/Git/Orm\startup.c **** 	select_controller(controller);
 888              		.loc 1 199 0
 889 0408 BB1D     		adds	r3, r7, #6
 890 040a 1B78     		ldrb	r3, [r3]
 891 040c 1800     		movs	r0, r3
 892 040e FFF72BFF 		bl	select_controller
 200:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_500ns();
 893              		.loc 1 200 0
 894 0412 FFF7FEFF 		bl	delay_500ns
 201:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 895              		.loc 1 201 0
 896 0416 4020     		movs	r0, #64
 897 0418 FFF7D6FE 		bl	graphic_ctrl_bit_set
 202:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_500ns();
 898              		.loc 1 202 0
 899 041c FFF7FEFF 		bl	delay_500ns
 203:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 900              		.loc 1 203 0
 901 0420 4020     		movs	r0, #64
 902 0422 FFF7F9FE 		bl	graphic_ctrl_bit_clear
 204:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 205:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(controller & B_CS1) {
 903              		.loc 1 205 0
 904 0426 BB1D     		adds	r3, r7, #6
 905 0428 1B78     		ldrb	r3, [r3]
 906 042a 0822     		movs	r2, #8
 907 042c 1340     		ands	r3, r2
 908 042e 04D0     		beq	.L47
 206:C:/Users/johan/Documents/Git/Orm\startup.c **** 		select_controller(B_CS1);
 909              		.loc 1 206 0
 910 0430 0820     		movs	r0, #8
 911 0432 FFF719FF 		bl	select_controller
 207:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_wait_ready();
 912              		.loc 1 207 0
 913 0436 FFF744FF 		bl	graphic_wait_ready
 914              	.L47:
 208:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 209:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(controller & B_CS2) {
 915              		.loc 1 209 0
 916 043a BB1D     		adds	r3, r7, #6
 917 043c 1B78     		ldrb	r3, [r3]
 918 043e 1022     		movs	r2, #16
 919 0440 1340     		ands	r3, r2
 920 0442 04D0     		beq	.L48
 210:C:/Users/johan/Documents/Git/Orm\startup.c **** 		select_controller(B_CS2);
 921              		.loc 1 210 0
 922 0444 1020     		movs	r0, #16
 923 0446 FFF70FFF 		bl	select_controller
 211:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_wait_ready();
 924              		.loc 1 211 0
 925 044a FFF73AFF 		bl	graphic_wait_ready
 926              	.L48:
 212:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 213:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portOdrHigh = 0;
 927              		.loc 1 213 0
 928 044e 064B     		ldr	r3, .L49
 929 0450 0022     		movs	r2, #0
 930 0452 1A70     		strb	r2, [r3]
 214:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 931              		.loc 1 214 0
 932 0454 4020     		movs	r0, #64
 933 0456 FFF7B7FE 		bl	graphic_ctrl_bit_set
 215:C:/Users/johan/Documents/Git/Orm\startup.c **** 	select_controller(0);
 934              		.loc 1 215 0
 935 045a 0020     		movs	r0, #0
 936 045c FFF704FF 		bl	select_controller
 216:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 937              		.loc 1 216 0
 938 0460 C046     		nop
 939 0462 BD46     		mov	sp, r7
 940 0464 02B0     		add	sp, sp, #8
 941              		@ sp needed
 942 0466 80BD     		pop	{r7, pc}
 943              	.L50:
 944              		.align	2
 945              	.L49:
 946 0468 15100240 		.word	1073877013
 947              		.cfi_endproc
 948              	.LFE11:
 950              		.align	1
 951              		.syntax unified
 952              		.code	16
 953              		.thumb_func
 954              		.fpu softvfp
 956              	graphic_write_command:
 957              	.LFB12:
 217:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 218:C:/Users/johan/Documents/Git/Orm\startup.c **** static void graphic_write_command(uint8_t command, uint8_t controller) {
 958              		.loc 1 218 0
 959              		.cfi_startproc
 960              		@ args = 0, pretend = 0, frame = 8
 961              		@ frame_needed = 1, uses_anonymous_args = 0
 962 046c 80B5     		push	{r7, lr}
 963              		.cfi_def_cfa_offset 8
 964              		.cfi_offset 7, -8
 965              		.cfi_offset 14, -4
 966 046e 82B0     		sub	sp, sp, #8
 967              		.cfi_def_cfa_offset 16
 968 0470 00AF     		add	r7, sp, #0
 969              		.cfi_def_cfa_register 7
 970 0472 0200     		movs	r2, r0
 971 0474 FB1D     		adds	r3, r7, #7
 972 0476 1A70     		strb	r2, [r3]
 973 0478 BB1D     		adds	r3, r7, #6
 974 047a 0A1C     		adds	r2, r1, #0
 975 047c 1A70     		strb	r2, [r3]
 219:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 976              		.loc 1 219 0
 977 047e 4020     		movs	r0, #64
 978 0480 FFF7CAFE 		bl	graphic_ctrl_bit_clear
 220:C:/Users/johan/Documents/Git/Orm\startup.c **** 	select_controller(controller);
 979              		.loc 1 220 0
 980 0484 BB1D     		adds	r3, r7, #6
 981 0486 1B78     		ldrb	r3, [r3]
 982 0488 1800     		movs	r0, r3
 983 048a FFF7EDFE 		bl	select_controller
 221:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_RS|B_RW);
 984              		.loc 1 221 0
 985 048e 0320     		movs	r0, #3
 986 0490 FFF7C2FE 		bl	graphic_ctrl_bit_clear
 222:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write(command, controller);
 987              		.loc 1 222 0
 988 0494 BB1D     		adds	r3, r7, #6
 989 0496 1A78     		ldrb	r2, [r3]
 990 0498 FB1D     		adds	r3, r7, #7
 991 049a 1B78     		ldrb	r3, [r3]
 992 049c 1100     		movs	r1, r2
 993 049e 1800     		movs	r0, r3
 994 04a0 FFF7A5FF 		bl	graphic_write
 223:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 995              		.loc 1 223 0
 996 04a4 C046     		nop
 997 04a6 BD46     		mov	sp, r7
 998 04a8 02B0     		add	sp, sp, #8
 999              		@ sp needed
 1000 04aa 80BD     		pop	{r7, pc}
 1001              		.cfi_endproc
 1002              	.LFE12:
 1004              		.align	1
 1005              		.syntax unified
 1006              		.code	16
 1007              		.thumb_func
 1008              		.fpu softvfp
 1010              	graphic_write_data:
 1011              	.LFB13:
 224:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 225:C:/Users/johan/Documents/Git/Orm\startup.c **** static void graphic_write_data(uint8_t data, uint8_t controller) {
 1012              		.loc 1 225 0
 1013              		.cfi_startproc
 1014              		@ args = 0, pretend = 0, frame = 8
 1015              		@ frame_needed = 1, uses_anonymous_args = 0
 1016 04ac 80B5     		push	{r7, lr}
 1017              		.cfi_def_cfa_offset 8
 1018              		.cfi_offset 7, -8
 1019              		.cfi_offset 14, -4
 1020 04ae 82B0     		sub	sp, sp, #8
 1021              		.cfi_def_cfa_offset 16
 1022 04b0 00AF     		add	r7, sp, #0
 1023              		.cfi_def_cfa_register 7
 1024 04b2 0200     		movs	r2, r0
 1025 04b4 FB1D     		adds	r3, r7, #7
 1026 04b6 1A70     		strb	r2, [r3]
 1027 04b8 BB1D     		adds	r3, r7, #6
 1028 04ba 0A1C     		adds	r2, r1, #0
 1029 04bc 1A70     		strb	r2, [r3]
 226:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 1030              		.loc 1 226 0
 1031 04be 4020     		movs	r0, #64
 1032 04c0 FFF7AAFE 		bl	graphic_ctrl_bit_clear
 227:C:/Users/johan/Documents/Git/Orm\startup.c **** 	select_controller(controller);
 1033              		.loc 1 227 0
 1034 04c4 BB1D     		adds	r3, r7, #6
 1035 04c6 1B78     		ldrb	r3, [r3]
 1036 04c8 1800     		movs	r0, r3
 1037 04ca FFF7CDFE 		bl	select_controller
 228:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 1038              		.loc 1 228 0
 1039 04ce 0120     		movs	r0, #1
 1040 04d0 FFF77AFE 		bl	graphic_ctrl_bit_set
 229:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 1041              		.loc 1 229 0
 1042 04d4 0220     		movs	r0, #2
 1043 04d6 FFF79FFE 		bl	graphic_ctrl_bit_clear
 230:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write(data, controller);
 1044              		.loc 1 230 0
 1045 04da BB1D     		adds	r3, r7, #6
 1046 04dc 1A78     		ldrb	r2, [r3]
 1047 04de FB1D     		adds	r3, r7, #7
 1048 04e0 1B78     		ldrb	r3, [r3]
 1049 04e2 1100     		movs	r1, r2
 1050 04e4 1800     		movs	r0, r3
 1051 04e6 FFF782FF 		bl	graphic_write
 231:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1052              		.loc 1 231 0
 1053 04ea C046     		nop
 1054 04ec BD46     		mov	sp, r7
 1055 04ee 02B0     		add	sp, sp, #8
 1056              		@ sp needed
 1057 04f0 80BD     		pop	{r7, pc}
 1058              		.cfi_endproc
 1059              	.LFE13:
 1061              		.align	1
 1062              		.global	graphic_clear_screen
 1063              		.syntax unified
 1064              		.code	16
 1065              		.thumb_func
 1066              		.fpu softvfp
 1068              	graphic_clear_screen:
 1069              	.LFB14:
 232:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 233:C:/Users/johan/Documents/Git/Orm\startup.c **** void graphic_clear_screen(void) {
 1070              		.loc 1 233 0
 1071              		.cfi_startproc
 1072              		@ args = 0, pretend = 0, frame = 8
 1073              		@ frame_needed = 1, uses_anonymous_args = 0
 1074 04f2 80B5     		push	{r7, lr}
 1075              		.cfi_def_cfa_offset 8
 1076              		.cfi_offset 7, -8
 1077              		.cfi_offset 14, -4
 1078 04f4 82B0     		sub	sp, sp, #8
 1079              		.cfi_def_cfa_offset 16
 1080 04f6 00AF     		add	r7, sp, #0
 1081              		.cfi_def_cfa_register 7
 234:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t i, j;
 235:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 236:C:/Users/johan/Documents/Git/Orm\startup.c **** 	for(j = 0; j < 8; j++) {
 1082              		.loc 1 236 0
 1083 04f8 BB1D     		adds	r3, r7, #6
 1084 04fa 0022     		movs	r2, #0
 1085 04fc 1A70     		strb	r2, [r3]
 1086 04fe 23E0     		b	.L54
 1087              	.L57:
 237:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1088              		.loc 1 237 0
 1089 0500 BB1D     		adds	r3, r7, #6
 1090 0502 1B78     		ldrb	r3, [r3]
 1091 0504 4822     		movs	r2, #72
 1092 0506 5242     		rsbs	r2, r2, #0
 1093 0508 1343     		orrs	r3, r2
 1094 050a DBB2     		uxtb	r3, r3
 1095 050c 1821     		movs	r1, #24
 1096 050e 1800     		movs	r0, r3
 1097 0510 FFF7ACFF 		bl	graphic_write_command
 238:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1098              		.loc 1 238 0
 1099 0514 1821     		movs	r1, #24
 1100 0516 4020     		movs	r0, #64
 1101 0518 FFF7A8FF 		bl	graphic_write_command
 239:C:/Users/johan/Documents/Git/Orm\startup.c **** 		for(i = 0; i <= 63; i++) {
 1102              		.loc 1 239 0
 1103 051c FB1D     		adds	r3, r7, #7
 1104 051e 0022     		movs	r2, #0
 1105 0520 1A70     		strb	r2, [r3]
 1106 0522 08E0     		b	.L55
 1107              	.L56:
 240:C:/Users/johan/Documents/Git/Orm\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 1108              		.loc 1 240 0 discriminator 3
 1109 0524 1821     		movs	r1, #24
 1110 0526 0020     		movs	r0, #0
 1111 0528 FFF7C0FF 		bl	graphic_write_data
 239:C:/Users/johan/Documents/Git/Orm\startup.c **** 		for(i = 0; i <= 63; i++) {
 1112              		.loc 1 239 0 discriminator 3
 1113 052c FB1D     		adds	r3, r7, #7
 1114 052e 1A78     		ldrb	r2, [r3]
 1115 0530 FB1D     		adds	r3, r7, #7
 1116 0532 0132     		adds	r2, r2, #1
 1117 0534 1A70     		strb	r2, [r3]
 1118              	.L55:
 239:C:/Users/johan/Documents/Git/Orm\startup.c **** 		for(i = 0; i <= 63; i++) {
 1119              		.loc 1 239 0 is_stmt 0 discriminator 1
 1120 0536 FB1D     		adds	r3, r7, #7
 1121 0538 1B78     		ldrb	r3, [r3]
 1122 053a 3F2B     		cmp	r3, #63
 1123 053c F2D9     		bls	.L56
 236:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1124              		.loc 1 236 0 is_stmt 1 discriminator 2
 1125 053e BB1D     		adds	r3, r7, #6
 1126 0540 1A78     		ldrb	r2, [r3]
 1127 0542 BB1D     		adds	r3, r7, #6
 1128 0544 0132     		adds	r2, r2, #1
 1129 0546 1A70     		strb	r2, [r3]
 1130              	.L54:
 236:C:/Users/johan/Documents/Git/Orm\startup.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1131              		.loc 1 236 0 is_stmt 0 discriminator 1
 1132 0548 BB1D     		adds	r3, r7, #6
 1133 054a 1B78     		ldrb	r3, [r3]
 1134 054c 072B     		cmp	r3, #7
 1135 054e D7D9     		bls	.L57
 241:C:/Users/johan/Documents/Git/Orm\startup.c **** 		}
 242:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 243:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1136              		.loc 1 243 0 is_stmt 1
 1137 0550 C046     		nop
 1138 0552 BD46     		mov	sp, r7
 1139 0554 02B0     		add	sp, sp, #8
 1140              		@ sp needed
 1141 0556 80BD     		pop	{r7, pc}
 1142              		.cfi_endproc
 1143              	.LFE14:
 1145              		.align	1
 1146              		.global	graphic_initialize
 1147              		.syntax unified
 1148              		.code	16
 1149              		.thumb_func
 1150              		.fpu softvfp
 1152              	graphic_initialize:
 1153              	.LFB15:
 244:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 245:C:/Users/johan/Documents/Git/Orm\startup.c **** void graphic_initialize(void) {
 1154              		.loc 1 245 0
 1155              		.cfi_startproc
 1156              		@ args = 0, pretend = 0, frame = 0
 1157              		@ frame_needed = 1, uses_anonymous_args = 0
 1158 0558 80B5     		push	{r7, lr}
 1159              		.cfi_def_cfa_offset 8
 1160              		.cfi_offset 7, -8
 1161              		.cfi_offset 14, -4
 1162 055a 00AF     		add	r7, sp, #0
 1163              		.cfi_def_cfa_register 7
 246:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_E);
 1164              		.loc 1 246 0
 1165 055c 4020     		movs	r0, #64
 1166 055e FFF733FE 		bl	graphic_ctrl_bit_set
 247:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_micro(10);
 1167              		.loc 1 247 0
 1168 0562 0A20     		movs	r0, #10
 1169 0564 FFF7FEFF 		bl	delay_micro
 248:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 1170              		.loc 1 248 0
 1171 0568 7820     		movs	r0, #120
 1172 056a FFF755FE 		bl	graphic_ctrl_bit_clear
 249:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_milli(30);
 1173              		.loc 1 249 0
 1174 056e 1E20     		movs	r0, #30
 1175 0570 FFF7FEFF 		bl	delay_milli
 250:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 1176              		.loc 1 250 0
 1177 0574 2020     		movs	r0, #32
 1178 0576 FFF727FE 		bl	graphic_ctrl_bit_set
 251:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_milli(100);
 1179              		.loc 1 251 0
 1180 057a 6420     		movs	r0, #100
 1181 057c FFF7FEFF 		bl	delay_milli
 252:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_OFF,			B_CS1|B_CS2);
 1182              		.loc 1 252 0
 1183 0580 1821     		movs	r1, #24
 1184 0582 3E20     		movs	r0, #62
 1185 0584 FFF772FF 		bl	graphic_write_command
 253:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_ON,			B_CS1|B_CS2);
 1186              		.loc 1 253 0
 1187 0588 1821     		movs	r1, #24
 1188 058a 3F20     		movs	r0, #63
 1189 058c FFF76EFF 		bl	graphic_write_command
 254:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_DISP_START,	B_CS1|B_CS2);
 1190              		.loc 1 254 0
 1191 0590 1821     		movs	r1, #24
 1192 0592 C020     		movs	r0, #192
 1193 0594 FFF76AFF 		bl	graphic_write_command
 255:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_ADD,		B_CS1|B_CS2);
 1194              		.loc 1 255 0
 1195 0598 1821     		movs	r1, #24
 1196 059a 4020     		movs	r0, #64
 1197 059c FFF766FF 		bl	graphic_write_command
 256:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_PAGE,		B_CS1|B_CS2);
 1198              		.loc 1 256 0
 1199 05a0 1821     		movs	r1, #24
 1200 05a2 B820     		movs	r0, #184
 1201 05a4 FFF762FF 		bl	graphic_write_command
 257:C:/Users/johan/Documents/Git/Orm\startup.c **** 	select_controller(0);
 1202              		.loc 1 257 0
 1203 05a8 0020     		movs	r0, #0
 1204 05aa FFF75DFE 		bl	select_controller
 258:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1205              		.loc 1 258 0
 1206 05ae C046     		nop
 1207 05b0 BD46     		mov	sp, r7
 1208              		@ sp needed
 1209 05b2 80BD     		pop	{r7, pc}
 1210              		.cfi_endproc
 1211              	.LFE15:
 1213              		.align	1
 1214              		.global	pixel
 1215              		.syntax unified
 1216              		.code	16
 1217              		.thumb_func
 1218              		.fpu softvfp
 1220              	pixel:
 1221              	.LFB16:
 259:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 260:C:/Users/johan/Documents/Git/Orm\startup.c **** void pixel(int x, int y, int set) {
 1222              		.loc 1 260 0
 1223              		.cfi_startproc
 1224              		@ args = 0, pretend = 0, frame = 32
 1225              		@ frame_needed = 1, uses_anonymous_args = 0
 1226 05b4 B0B5     		push	{r4, r5, r7, lr}
 1227              		.cfi_def_cfa_offset 16
 1228              		.cfi_offset 4, -16
 1229              		.cfi_offset 5, -12
 1230              		.cfi_offset 7, -8
 1231              		.cfi_offset 14, -4
 1232 05b6 88B0     		sub	sp, sp, #32
 1233              		.cfi_def_cfa_offset 48
 1234 05b8 00AF     		add	r7, sp, #0
 1235              		.cfi_def_cfa_register 7
 1236 05ba F860     		str	r0, [r7, #12]
 1237 05bc B960     		str	r1, [r7, #8]
 1238 05be 7A60     		str	r2, [r7, #4]
 261:C:/Users/johan/Documents/Git/Orm\startup.c **** 	uint8_t mask, c, controller;
 262:C:/Users/johan/Documents/Git/Orm\startup.c **** 	int index;
 263:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 264:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1239              		.loc 1 264 0
 1240 05c0 FB68     		ldr	r3, [r7, #12]
 1241 05c2 002B     		cmp	r3, #0
 1242 05c4 00DC     		bgt	.LCB1023
 1243 05c6 8EE0     		b	.L70	@long jump
 1244              	.LCB1023:
 1245              		.loc 1 264 0 is_stmt 0 discriminator 1
 1246 05c8 BB68     		ldr	r3, [r7, #8]
 1247 05ca 002B     		cmp	r3, #0
 1248 05cc 00DC     		bgt	.LCB1026
 1249 05ce 8AE0     		b	.L70	@long jump
 1250              	.LCB1026:
 1251              		.loc 1 264 0 discriminator 2
 1252 05d0 FB68     		ldr	r3, [r7, #12]
 1253 05d2 802B     		cmp	r3, #128
 1254 05d4 00DD     		ble	.LCB1029
 1255 05d6 86E0     		b	.L70	@long jump
 1256              	.LCB1029:
 1257              		.loc 1 264 0 discriminator 3
 1258 05d8 BB68     		ldr	r3, [r7, #8]
 1259 05da 402B     		cmp	r3, #64
 1260 05dc 00DD     		ble	.LCB1032
 1261 05de 82E0     		b	.L70	@long jump
 1262              	.LCB1032:
 265:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 266:C:/Users/johan/Documents/Git/Orm\startup.c **** 	index = (y-1)/8;
 1263              		.loc 1 266 0 is_stmt 1
 1264 05e0 BB68     		ldr	r3, [r7, #8]
 1265 05e2 013B     		subs	r3, r3, #1
 1266 05e4 002B     		cmp	r3, #0
 1267 05e6 00DA     		bge	.L63
 1268 05e8 0733     		adds	r3, r3, #7
 1269              	.L63:
 1270 05ea DB10     		asrs	r3, r3, #3
 1271 05ec BB61     		str	r3, [r7, #24]
 267:C:/Users/johan/Documents/Git/Orm\startup.c **** 	mask = 1 << ((y - 1) % 8);
 1272              		.loc 1 267 0
 1273 05ee BB68     		ldr	r3, [r7, #8]
 1274 05f0 013B     		subs	r3, r3, #1
 1275 05f2 3F4A     		ldr	r2, .L71
 1276 05f4 1340     		ands	r3, r2
 1277 05f6 04D5     		bpl	.L64
 1278 05f8 013B     		subs	r3, r3, #1
 1279 05fa 0822     		movs	r2, #8
 1280 05fc 5242     		rsbs	r2, r2, #0
 1281 05fe 1343     		orrs	r3, r2
 1282 0600 0133     		adds	r3, r3, #1
 1283              	.L64:
 1284 0602 1A00     		movs	r2, r3
 1285 0604 0123     		movs	r3, #1
 1286 0606 9340     		lsls	r3, r3, r2
 1287 0608 1A00     		movs	r2, r3
 1288 060a 1F23     		movs	r3, #31
 1289 060c FB18     		adds	r3, r7, r3
 1290 060e 1A70     		strb	r2, [r3]
 268:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 269:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(set == 0)
 1291              		.loc 1 269 0
 1292 0610 7B68     		ldr	r3, [r7, #4]
 1293 0612 002B     		cmp	r3, #0
 1294 0614 05D1     		bne	.L65
 270:C:/Users/johan/Documents/Git/Orm\startup.c **** 		mask = ~mask;
 1295              		.loc 1 270 0
 1296 0616 1F22     		movs	r2, #31
 1297 0618 BB18     		adds	r3, r7, r2
 1298 061a BA18     		adds	r2, r7, r2
 1299 061c 1278     		ldrb	r2, [r2]
 1300 061e D243     		mvns	r2, r2
 1301 0620 1A70     		strb	r2, [r3]
 1302              	.L65:
 271:C:/Users/johan/Documents/Git/Orm\startup.c **** 		
 272:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(x > 64) {
 1303              		.loc 1 272 0
 1304 0622 FB68     		ldr	r3, [r7, #12]
 1305 0624 402B     		cmp	r3, #64
 1306 0626 07DD     		ble	.L66
 273:C:/Users/johan/Documents/Git/Orm\startup.c **** 		controller = B_CS2;
 1307              		.loc 1 273 0
 1308 0628 1E23     		movs	r3, #30
 1309 062a FB18     		adds	r3, r7, r3
 1310 062c 1022     		movs	r2, #16
 1311 062e 1A70     		strb	r2, [r3]
 274:C:/Users/johan/Documents/Git/Orm\startup.c **** 		x = x - 65;
 1312              		.loc 1 274 0
 1313 0630 FB68     		ldr	r3, [r7, #12]
 1314 0632 413B     		subs	r3, r3, #65
 1315 0634 FB60     		str	r3, [r7, #12]
 1316 0636 06E0     		b	.L67
 1317              	.L66:
 275:C:/Users/johan/Documents/Git/Orm\startup.c **** 	} else {
 276:C:/Users/johan/Documents/Git/Orm\startup.c **** 		controller = B_CS1;
 1318              		.loc 1 276 0
 1319 0638 1E23     		movs	r3, #30
 1320 063a FB18     		adds	r3, r7, r3
 1321 063c 0822     		movs	r2, #8
 1322 063e 1A70     		strb	r2, [r3]
 277:C:/Users/johan/Documents/Git/Orm\startup.c **** 		x = x - 1;
 1323              		.loc 1 277 0
 1324 0640 FB68     		ldr	r3, [r7, #12]
 1325 0642 013B     		subs	r3, r3, #1
 1326 0644 FB60     		str	r3, [r7, #12]
 1327              	.L67:
 278:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 279:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 280:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_ADD	| x, controller);
 1328              		.loc 1 280 0
 1329 0646 FB68     		ldr	r3, [r7, #12]
 1330 0648 5BB2     		sxtb	r3, r3
 1331 064a 4022     		movs	r2, #64
 1332 064c 1343     		orrs	r3, r2
 1333 064e 5BB2     		sxtb	r3, r3
 1334 0650 DAB2     		uxtb	r2, r3
 1335 0652 1E25     		movs	r5, #30
 1336 0654 7B19     		adds	r3, r7, r5
 1337 0656 1B78     		ldrb	r3, [r3]
 1338 0658 1900     		movs	r1, r3
 1339 065a 1000     		movs	r0, r2
 1340 065c FFF706FF 		bl	graphic_write_command
 281:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_PAGE	| index, controller);
 1341              		.loc 1 281 0
 1342 0660 BB69     		ldr	r3, [r7, #24]
 1343 0662 5BB2     		sxtb	r3, r3
 1344 0664 4822     		movs	r2, #72
 1345 0666 5242     		rsbs	r2, r2, #0
 1346 0668 1343     		orrs	r3, r2
 1347 066a 5BB2     		sxtb	r3, r3
 1348 066c DAB2     		uxtb	r2, r3
 1349 066e 7B19     		adds	r3, r7, r5
 1350 0670 1B78     		ldrb	r3, [r3]
 1351 0672 1900     		movs	r1, r3
 1352 0674 1000     		movs	r0, r2
 1353 0676 FFF7F9FE 		bl	graphic_write_command
 282:C:/Users/johan/Documents/Git/Orm\startup.c **** 	c = graphic_read_data(controller);
 1354              		.loc 1 282 0
 1355 067a 1723     		movs	r3, #23
 1356 067c FC18     		adds	r4, r7, r3
 1357 067e 7B19     		adds	r3, r7, r5
 1358 0680 1B78     		ldrb	r3, [r3]
 1359 0682 1800     		movs	r0, r3
 1360 0684 FFF79EFE 		bl	graphic_read_data
 1361 0688 0300     		movs	r3, r0
 1362 068a 2370     		strb	r3, [r4]
 283:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_command(LCD_SET_ADD	| x, controller);
 1363              		.loc 1 283 0
 1364 068c FB68     		ldr	r3, [r7, #12]
 1365 068e 5BB2     		sxtb	r3, r3
 1366 0690 4022     		movs	r2, #64
 1367 0692 1343     		orrs	r3, r2
 1368 0694 5BB2     		sxtb	r3, r3
 1369 0696 DAB2     		uxtb	r2, r3
 1370 0698 7B19     		adds	r3, r7, r5
 1371 069a 1B78     		ldrb	r3, [r3]
 1372 069c 1900     		movs	r1, r3
 1373 069e 1000     		movs	r0, r2
 1374 06a0 FFF7E4FE 		bl	graphic_write_command
 284:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 285:C:/Users/johan/Documents/Git/Orm\startup.c **** 	if(set)
 1375              		.loc 1 285 0
 1376 06a4 7B68     		ldr	r3, [r7, #4]
 1377 06a6 002B     		cmp	r3, #0
 1378 06a8 09D0     		beq	.L68
 286:C:/Users/johan/Documents/Git/Orm\startup.c **** 		mask = mask | c;
 1379              		.loc 1 286 0
 1380 06aa 1F22     		movs	r2, #31
 1381 06ac BB18     		adds	r3, r7, r2
 1382 06ae B918     		adds	r1, r7, r2
 1383 06b0 1722     		movs	r2, #23
 1384 06b2 BA18     		adds	r2, r7, r2
 1385 06b4 0978     		ldrb	r1, [r1]
 1386 06b6 1278     		ldrb	r2, [r2]
 1387 06b8 0A43     		orrs	r2, r1
 1388 06ba 1A70     		strb	r2, [r3]
 1389 06bc 08E0     		b	.L69
 1390              	.L68:
 287:C:/Users/johan/Documents/Git/Orm\startup.c **** 	else
 288:C:/Users/johan/Documents/Git/Orm\startup.c **** 		mask = mask & c;
 1391              		.loc 1 288 0
 1392 06be 1F22     		movs	r2, #31
 1393 06c0 BB18     		adds	r3, r7, r2
 1394 06c2 BA18     		adds	r2, r7, r2
 1395 06c4 1721     		movs	r1, #23
 1396 06c6 7918     		adds	r1, r7, r1
 1397 06c8 1278     		ldrb	r2, [r2]
 1398 06ca 0978     		ldrb	r1, [r1]
 1399 06cc 0A40     		ands	r2, r1
 1400 06ce 1A70     		strb	r2, [r3]
 1401              	.L69:
 289:C:/Users/johan/Documents/Git/Orm\startup.c **** 		
 290:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_write_data(mask, controller);
 1402              		.loc 1 290 0
 1403 06d0 1E23     		movs	r3, #30
 1404 06d2 FB18     		adds	r3, r7, r3
 1405 06d4 1A78     		ldrb	r2, [r3]
 1406 06d6 1F23     		movs	r3, #31
 1407 06d8 FB18     		adds	r3, r7, r3
 1408 06da 1B78     		ldrb	r3, [r3]
 1409 06dc 1100     		movs	r1, r2
 1410 06de 1800     		movs	r0, r3
 1411 06e0 FFF7E4FE 		bl	graphic_write_data
 1412 06e4 00E0     		b	.L59
 1413              	.L70:
 264:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 1414              		.loc 1 264 0
 1415 06e6 C046     		nop
 1416              	.L59:
 291:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1417              		.loc 1 291 0
 1418 06e8 BD46     		mov	sp, r7
 1419 06ea 08B0     		add	sp, sp, #32
 1420              		@ sp needed
 1421 06ec B0BD     		pop	{r4, r5, r7, pc}
 1422              	.L72:
 1423 06ee C046     		.align	2
 1424              	.L71:
 1425 06f0 07000080 		.word	-2147483641
 1426              		.cfi_endproc
 1427              	.LFE16:
 1429              		.align	1
 1430              		.global	delay_250ns
 1431              		.syntax unified
 1432              		.code	16
 1433              		.thumb_func
 1434              		.fpu softvfp
 1436              	delay_250ns:
 1437              	.LFB17:
 292:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 293:C:/Users/johan/Documents/Git/Orm\startup.c **** void delay_250ns(void) {
 1438              		.loc 1 293 0
 1439              		.cfi_startproc
 1440              		@ args = 0, pretend = 0, frame = 0
 1441              		@ frame_needed = 1, uses_anonymous_args = 0
 1442 06f4 80B5     		push	{r7, lr}
 1443              		.cfi_def_cfa_offset 8
 1444              		.cfi_offset 7, -8
 1445              		.cfi_offset 14, -4
 1446 06f6 00AF     		add	r7, sp, #0
 1447              		.cfi_def_cfa_register 7
 294:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*STK_CTRL = 0;				// clear SysTik
 1448              		.loc 1 294 0
 1449 06f8 0C4B     		ldr	r3, .L75
 1450 06fa 0022     		movs	r2, #0
 1451 06fc 1A60     		str	r2, [r3]
 295:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*STK_LOAD = 41;				// initialize with 42 cycles
 1452              		.loc 1 295 0
 1453 06fe 0C4B     		ldr	r3, .L75+4
 1454 0700 2922     		movs	r2, #41
 1455 0702 1A60     		str	r2, [r3]
 296:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*STK_VAL = 0;				// clear countregister
 1456              		.loc 1 296 0
 1457 0704 0B4B     		ldr	r3, .L75+8
 1458 0706 0022     		movs	r2, #0
 1459 0708 1A60     		str	r2, [r3]
 297:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*STK_CTRL = 5;				// reset counter
 1460              		.loc 1 297 0
 1461 070a 084B     		ldr	r3, .L75
 1462 070c 0522     		movs	r2, #5
 1463 070e 1A60     		str	r2, [r3]
 298:C:/Users/johan/Documents/Git/Orm\startup.c **** 	while ((*STK_CTRL & 0x00010000) == 0) {}	// wait until COUNTFLAG = 1
 1464              		.loc 1 298 0
 1465 0710 C046     		nop
 1466              	.L74:
 1467              		.loc 1 298 0 is_stmt 0 discriminator 1
 1468 0712 064B     		ldr	r3, .L75
 1469 0714 1A68     		ldr	r2, [r3]
 1470 0716 8023     		movs	r3, #128
 1471 0718 5B02     		lsls	r3, r3, #9
 1472 071a 1340     		ands	r3, r2
 1473 071c F9D0     		beq	.L74
 299:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*STK_CTRL = 0;				// clear SysTik
 1474              		.loc 1 299 0 is_stmt 1
 1475 071e 034B     		ldr	r3, .L75
 1476 0720 0022     		movs	r2, #0
 1477 0722 1A60     		str	r2, [r3]
 300:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1478              		.loc 1 300 0
 1479 0724 C046     		nop
 1480 0726 BD46     		mov	sp, r7
 1481              		@ sp needed
 1482 0728 80BD     		pop	{r7, pc}
 1483              	.L76:
 1484 072a C046     		.align	2
 1485              	.L75:
 1486 072c 10E000E0 		.word	-536813552
 1487 0730 14E000E0 		.word	-536813548
 1488 0734 18E000E0 		.word	-536813544
 1489              		.cfi_endproc
 1490              	.LFE17:
 1492              		.align	1
 1493              		.global	delay_500ns
 1494              		.syntax unified
 1495              		.code	16
 1496              		.thumb_func
 1497              		.fpu softvfp
 1499              	delay_500ns:
 1500              	.LFB18:
 301:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 302:C:/Users/johan/Documents/Git/Orm\startup.c **** void delay_500ns(void) {
 1501              		.loc 1 302 0
 1502              		.cfi_startproc
 1503              		@ args = 0, pretend = 0, frame = 0
 1504              		@ frame_needed = 1, uses_anonymous_args = 0
 1505 0738 80B5     		push	{r7, lr}
 1506              		.cfi_def_cfa_offset 8
 1507              		.cfi_offset 7, -8
 1508              		.cfi_offset 14, -4
 1509 073a 00AF     		add	r7, sp, #0
 1510              		.cfi_def_cfa_register 7
 303:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_250ns();
 1511              		.loc 1 303 0
 1512 073c FFF7FEFF 		bl	delay_250ns
 304:C:/Users/johan/Documents/Git/Orm\startup.c **** 	delay_250ns();
 1513              		.loc 1 304 0
 1514 0740 FFF7FEFF 		bl	delay_250ns
 305:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1515              		.loc 1 305 0
 1516 0744 C046     		nop
 1517 0746 BD46     		mov	sp, r7
 1518              		@ sp needed
 1519 0748 80BD     		pop	{r7, pc}
 1520              		.cfi_endproc
 1521              	.LFE18:
 1523              		.align	1
 1524              		.global	delay_micro
 1525              		.syntax unified
 1526              		.code	16
 1527              		.thumb_func
 1528              		.fpu softvfp
 1530              	delay_micro:
 1531              	.LFB19:
 306:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 307:C:/Users/johan/Documents/Git/Orm\startup.c **** void delay_micro(unsigned int us) {
 1532              		.loc 1 307 0
 1533              		.cfi_startproc
 1534              		@ args = 0, pretend = 0, frame = 8
 1535              		@ frame_needed = 1, uses_anonymous_args = 0
 1536 074a 80B5     		push	{r7, lr}
 1537              		.cfi_def_cfa_offset 8
 1538              		.cfi_offset 7, -8
 1539              		.cfi_offset 14, -4
 1540 074c 82B0     		sub	sp, sp, #8
 1541              		.cfi_def_cfa_offset 16
 1542 074e 00AF     		add	r7, sp, #0
 1543              		.cfi_def_cfa_register 7
 1544 0750 7860     		str	r0, [r7, #4]
 308:C:/Users/johan/Documents/Git/Orm\startup.c **** 	while(us--) {
 1545              		.loc 1 308 0
 1546 0752 07E0     		b	.L79
 1547              	.L80:
 309:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_250ns();
 1548              		.loc 1 309 0
 1549 0754 FFF7FEFF 		bl	delay_250ns
 310:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_250ns();
 1550              		.loc 1 310 0
 1551 0758 FFF7FEFF 		bl	delay_250ns
 311:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_250ns();
 1552              		.loc 1 311 0
 1553 075c FFF7FEFF 		bl	delay_250ns
 312:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_250ns();
 1554              		.loc 1 312 0
 1555 0760 FFF7FEFF 		bl	delay_250ns
 1556              	.L79:
 308:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_250ns();
 1557              		.loc 1 308 0
 1558 0764 7B68     		ldr	r3, [r7, #4]
 1559 0766 5A1E     		subs	r2, r3, #1
 1560 0768 7A60     		str	r2, [r7, #4]
 1561 076a 002B     		cmp	r3, #0
 1562 076c F2D1     		bne	.L80
 313:C:/Users/johan/Documents/Git/Orm\startup.c **** 	} 
 314:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1563              		.loc 1 314 0
 1564 076e C046     		nop
 1565 0770 BD46     		mov	sp, r7
 1566 0772 02B0     		add	sp, sp, #8
 1567              		@ sp needed
 1568 0774 80BD     		pop	{r7, pc}
 1569              		.cfi_endproc
 1570              	.LFE19:
 1572              		.align	1
 1573              		.global	delay_milli
 1574              		.syntax unified
 1575              		.code	16
 1576              		.thumb_func
 1577              		.fpu softvfp
 1579              	delay_milli:
 1580              	.LFB20:
 315:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 316:C:/Users/johan/Documents/Git/Orm\startup.c **** void delay_milli(unsigned int ms) {
 1581              		.loc 1 316 0
 1582              		.cfi_startproc
 1583              		@ args = 0, pretend = 0, frame = 8
 1584              		@ frame_needed = 1, uses_anonymous_args = 0
 1585 0776 80B5     		push	{r7, lr}
 1586              		.cfi_def_cfa_offset 8
 1587              		.cfi_offset 7, -8
 1588              		.cfi_offset 14, -4
 1589 0778 82B0     		sub	sp, sp, #8
 1590              		.cfi_def_cfa_offset 16
 1591 077a 00AF     		add	r7, sp, #0
 1592              		.cfi_def_cfa_register 7
 1593 077c 7860     		str	r0, [r7, #4]
 317:C:/Users/johan/Documents/Git/Orm\startup.c **** //	#ifdef SIMULATOR
 318:C:/Users/johan/Documents/Git/Orm\startup.c **** 		while( ms-- )
 1594              		.loc 1 318 0
 1595 077e 02E0     		b	.L82
 1596              	.L83:
 319:C:/Users/johan/Documents/Git/Orm\startup.c **** 			delay_micro(1);
 1597              		.loc 1 319 0
 1598 0780 0120     		movs	r0, #1
 1599 0782 FFF7FEFF 		bl	delay_micro
 1600              	.L82:
 318:C:/Users/johan/Documents/Git/Orm\startup.c **** 			delay_micro(1);
 1601              		.loc 1 318 0
 1602 0786 7B68     		ldr	r3, [r7, #4]
 1603 0788 5A1E     		subs	r2, r3, #1
 1604 078a 7A60     		str	r2, [r7, #4]
 1605 078c 002B     		cmp	r3, #0
 1606 078e F7D1     		bne	.L83
 320:C:/Users/johan/Documents/Git/Orm\startup.c **** //	#else
 321:C:/Users/johan/Documents/Git/Orm\startup.c **** //		while( ms-- )
 322:C:/Users/johan/Documents/Git/Orm\startup.c **** //			delay_micro(1000);
 323:C:/Users/johan/Documents/Git/Orm\startup.c **** //	#endif
 324:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1607              		.loc 1 324 0
 1608 0790 C046     		nop
 1609 0792 BD46     		mov	sp, r7
 1610 0794 02B0     		add	sp, sp, #8
 1611              		@ sp needed
 1612 0796 80BD     		pop	{r7, pc}
 1613              		.cfi_endproc
 1614              	.LFE20:
 1616              		.align	1
 1617              		.global	init_app
 1618              		.syntax unified
 1619              		.code	16
 1620              		.thumb_func
 1621              		.fpu softvfp
 1623              	init_app:
 1624              	.LFB21:
 325:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 326:C:/Users/johan/Documents/Git/Orm\startup.c **** void init_app(void) {
 1625              		.loc 1 326 0
 1626              		.cfi_startproc
 1627              		@ args = 0, pretend = 0, frame = 0
 1628              		@ frame_needed = 1, uses_anonymous_args = 0
 1629 0798 80B5     		push	{r7, lr}
 1630              		.cfi_def_cfa_offset 8
 1631              		.cfi_offset 7, -8
 1632              		.cfi_offset 14, -4
 1633 079a 00AF     		add	r7, sp, #0
 1634              		.cfi_def_cfa_register 7
 327:C:/Users/johan/Documents/Git/Orm\startup.c **** 	*portModer = 0x55555555;	// 15-0 outport
 1635              		.loc 1 327 0
 1636 079c 024B     		ldr	r3, .L85
 1637 079e 034A     		ldr	r2, .L85+4
 1638 07a0 1A60     		str	r2, [r3]
 328:C:/Users/johan/Documents/Git/Orm\startup.c **** }
 1639              		.loc 1 328 0
 1640 07a2 C046     		nop
 1641 07a4 BD46     		mov	sp, r7
 1642              		@ sp needed
 1643 07a6 80BD     		pop	{r7, pc}
 1644              	.L86:
 1645              		.align	2
 1646              	.L85:
 1647 07a8 00100240 		.word	1073876992
 1648 07ac 55555555 		.word	1431655765
 1649              		.cfi_endproc
 1650              	.LFE21:
 1652              		.global	ball_geometry
 1653              		.data
 1654              		.align	2
 1657              	ball_geometry:
 1658 0000 0C000000 		.word	12
 1659 0004 04000000 		.word	4
 1660 0008 04000000 		.word	4
 1661 000c 00       		.byte	0
 1662 000d 01       		.byte	1
 1663 000e 00       		.byte	0
 1664 000f 02       		.byte	2
 1665 0010 01       		.byte	1
 1666 0011 00       		.byte	0
 1667 0012 01       		.byte	1
 1668 0013 01       		.byte	1
 1669 0014 01       		.byte	1
 1670 0015 02       		.byte	2
 1671 0016 01       		.byte	1
 1672 0017 03       		.byte	3
 1673 0018 02       		.byte	2
 1674 0019 00       		.byte	0
 1675 001a 02       		.byte	2
 1676 001b 01       		.byte	1
 1677 001c 02       		.byte	2
 1678 001d 02       		.byte	2
 1679 001e 02       		.byte	2
 1680 001f 03       		.byte	3
 1681 0020 03       		.byte	3
 1682 0021 01       		.byte	1
 1683 0022 03       		.byte	3
 1684 0023 02       		.byte	2
 1685 0024 00000000 		.space	16
 1685      00000000 
 1685      00000000 
 1685      00000000 
 1686              		.global	ball
 1687              		.align	2
 1690              	ball:
 1691 0034 00000000 		.word	ball_geometry
 1692 0038 00000000 		.word	0
 1693 003c 00000000 		.word	0
 1694 0040 01000000 		.word	1
 1695 0044 01000000 		.word	1
 1696 0048 00000000 		.word	draw_object
 1697 004c 00000000 		.word	clear_object
 1698 0050 00000000 		.word	move_object
 1699 0054 00000000 		.word	set_object_speed
 1700              		.text
 1701              		.align	1
 1702              		.global	main
 1703              		.syntax unified
 1704              		.code	16
 1705              		.thumb_func
 1706              		.fpu softvfp
 1708              	main:
 1709              	.LFB22:
 329:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 330:C:/Users/johan/Documents/Git/Orm\startup.c **** GEOMETRY ball_geometry =
 331:C:/Users/johan/Documents/Git/Orm\startup.c **** {
 332:C:/Users/johan/Documents/Git/Orm\startup.c **** 	12,
 333:C:/Users/johan/Documents/Git/Orm\startup.c **** 	4,4,
 334:C:/Users/johan/Documents/Git/Orm\startup.c **** 	{
 335:C:/Users/johan/Documents/Git/Orm\startup.c **** 		{0,1}, {0,2}, {1,0}, {1,1}, {1,2},
 336:C:/Users/johan/Documents/Git/Orm\startup.c **** 		{1,3}, {2,0}, {2,1}, {2,2}, {2,3},
 337:C:/Users/johan/Documents/Git/Orm\startup.c **** 		{3,1}, {3,2}
 338:C:/Users/johan/Documents/Git/Orm\startup.c **** 	}
 339:C:/Users/johan/Documents/Git/Orm\startup.c **** };
 340:C:/Users/johan/Documents/Git/Orm\startup.c **** 	
 341:C:/Users/johan/Documents/Git/Orm\startup.c **** OBJECT ball =
 342:C:/Users/johan/Documents/Git/Orm\startup.c **** {
 343:C:/Users/johan/Documents/Git/Orm\startup.c **** 	&ball_geometry,
 344:C:/Users/johan/Documents/Git/Orm\startup.c **** 	0,0,
 345:C:/Users/johan/Documents/Git/Orm\startup.c **** 	1,1,
 346:C:/Users/johan/Documents/Git/Orm\startup.c **** 	draw_object,
 347:C:/Users/johan/Documents/Git/Orm\startup.c **** 	clear_object,
 348:C:/Users/johan/Documents/Git/Orm\startup.c **** 	move_object,
 349:C:/Users/johan/Documents/Git/Orm\startup.c **** 	set_object_speed
 350:C:/Users/johan/Documents/Git/Orm\startup.c **** };
 351:C:/Users/johan/Documents/Git/Orm\startup.c **** 
 352:C:/Users/johan/Documents/Git/Orm\startup.c **** void main(void) {	
 1710              		.loc 1 352 0
 1711              		.cfi_startproc
 1712              		@ args = 0, pretend = 0, frame = 8
 1713              		@ frame_needed = 1, uses_anonymous_args = 0
 1714 07b0 80B5     		push	{r7, lr}
 1715              		.cfi_def_cfa_offset 8
 1716              		.cfi_offset 7, -8
 1717              		.cfi_offset 14, -4
 1718 07b2 82B0     		sub	sp, sp, #8
 1719              		.cfi_def_cfa_offset 16
 1720 07b4 00AF     		add	r7, sp, #0
 1721              		.cfi_def_cfa_register 7
 353:C:/Users/johan/Documents/Git/Orm\startup.c **** 	POBJECT p = &ball;
 1722              		.loc 1 353 0
 1723 07b6 0A4B     		ldr	r3, .L89
 1724 07b8 7B60     		str	r3, [r7, #4]
 354:C:/Users/johan/Documents/Git/Orm\startup.c **** 	init_app();
 1725              		.loc 1 354 0
 1726 07ba FFF7FEFF 		bl	init_app
 355:C:/Users/johan/Documents/Git/Orm\startup.c **** 	graphic_initialize();
 1727              		.loc 1 355 0
 1728 07be FFF7FEFF 		bl	graphic_initialize
 356:C:/Users/johan/Documents/Git/Orm\startup.c **** #ifndef SIMULATOR
 357:C:/Users/johan/Documents/Git/Orm\startup.c **** 	//graphic_clear_screen();
 358:C:/Users/johan/Documents/Git/Orm\startup.c **** #endif
 359:C:/Users/johan/Documents/Git/Orm\startup.c **** 	p->set_speed(p, 4, 1);
 1729              		.loc 1 359 0
 1730 07c2 7B68     		ldr	r3, [r7, #4]
 1731 07c4 1B6A     		ldr	r3, [r3, #32]
 1732 07c6 7868     		ldr	r0, [r7, #4]
 1733 07c8 0122     		movs	r2, #1
 1734 07ca 0421     		movs	r1, #4
 1735 07cc 9847     		blx	r3
 1736              	.LVL0:
 1737              	.L88:
 360:C:/Users/johan/Documents/Git/Orm\startup.c **** 	while(1) {
 361:C:/Users/johan/Documents/Git/Orm\startup.c **** 		p->move(p);
 1738              		.loc 1 361 0 discriminator 1
 1739 07ce 7B68     		ldr	r3, [r7, #4]
 1740 07d0 DB69     		ldr	r3, [r3, #28]
 1741 07d2 7A68     		ldr	r2, [r7, #4]
 1742 07d4 1000     		movs	r0, r2
 1743 07d6 9847     		blx	r3
 1744              	.LVL1:
 362:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_milli(40);
 1745              		.loc 1 362 0 discriminator 1
 1746 07d8 2820     		movs	r0, #40
 1747 07da FFF7FEFF 		bl	delay_milli
 361:C:/Users/johan/Documents/Git/Orm\startup.c **** 		delay_milli(40);
 1748              		.loc 1 361 0 discriminator 1
 1749 07de F6E7     		b	.L88
 1750              	.L90:
 1751              		.align	2
 1752              	.L89:
 1753 07e0 00000000 		.word	ball
 1754              		.cfi_endproc
 1755              	.LFE22:
 1757              	.Letext0:
