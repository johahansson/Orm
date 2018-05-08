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
  14:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #include "graphics.h"
  15:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #include "defines.h"
  16:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  17:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** typedef struct tPoint {
  18:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t x;
  19:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	uint8_t y;
  20:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** } POINT;
  21:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  22:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** typedef struct tGeometry {
  23:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int numpoints;
  24:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int sizex;
  25:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int sizey;
  26:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	POINT px[MAX_POINTS];
  27:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** } GEOMETRY, *PGEOMETRY;
  28:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  29:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** typedef struct tObj {
  30:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	PGEOMETRY geo;
  31:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int dirx, diry;
  32:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int posx, posy;
  33:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*draw)(struct tObj*);
  34:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*clear)(struct tObj*);
  35:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*move)(struct tObj*);
  36:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	void (*set_speed)(struct tObj*, int, int);
  37:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** } OBJECT, *POBJECT;
  38:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  39:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy) {
  57              		.loc 1 39 0
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
  40:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->dirx = speedx;
  72              		.loc 1 40 0
  73 000c FB68     		ldr	r3, [r7, #12]
  74 000e BA68     		ldr	r2, [r7, #8]
  75 0010 5A60     		str	r2, [r3, #4]
  41:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->diry = speedy;
  76              		.loc 1 41 0
  77 0012 FB68     		ldr	r3, [r7, #12]
  78 0014 7A68     		ldr	r2, [r7, #4]
  79 0016 9A60     		str	r2, [r3, #8]
  42:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
  80              		.loc 1 42 0
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
  43:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  44:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void draw_object(POBJECT o) {
  98              		.loc 1 44 0
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
  45:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 112              		.loc 1 45 0
 113 0028 0023     		movs	r3, #0
 114 002a FB60     		str	r3, [r7, #12]
 115 002c 17E0     		b	.L4
 116              	.L5:
  46:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		pixel(o->geo->px[i].x, o->geo->px[i].y, 1);
 117              		.loc 1 46 0 discriminator 3
 118 002e 7B68     		ldr	r3, [r7, #4]
 119 0030 1A68     		ldr	r2, [r3]
 120 0032 FB68     		ldr	r3, [r7, #12]
 121 0034 0433     		adds	r3, r3, #4
 122 0036 5B00     		lsls	r3, r3, #1
 123 0038 D318     		adds	r3, r2, r3
 124 003a 0433     		adds	r3, r3, #4
 125 003c 1B78     		ldrb	r3, [r3]
 126 003e 1800     		movs	r0, r3
 127 0040 7B68     		ldr	r3, [r7, #4]
 128 0042 1A68     		ldr	r2, [r3]
 129 0044 FB68     		ldr	r3, [r7, #12]
 130 0046 0433     		adds	r3, r3, #4
 131 0048 5B00     		lsls	r3, r3, #1
 132 004a D318     		adds	r3, r2, r3
 133 004c 0533     		adds	r3, r3, #5
 134 004e 1B78     		ldrb	r3, [r3]
 135 0050 0122     		movs	r2, #1
 136 0052 1900     		movs	r1, r3
 137 0054 FFF7FEFF 		bl	pixel
  45:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 138              		.loc 1 45 0 discriminator 3
 139 0058 FB68     		ldr	r3, [r7, #12]
 140 005a 0133     		adds	r3, r3, #1
 141 005c FB60     		str	r3, [r7, #12]
 142              	.L4:
  45:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 143              		.loc 1 45 0 is_stmt 0 discriminator 1
 144 005e 7B68     		ldr	r3, [r7, #4]
 145 0060 1B68     		ldr	r3, [r3]
 146 0062 1B68     		ldr	r3, [r3]
 147 0064 FA68     		ldr	r2, [r7, #12]
 148 0066 9A42     		cmp	r2, r3
 149 0068 E1DB     		blt	.L5
 150              	.LBE2:
  47:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
  48:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 151              		.loc 1 48 0 is_stmt 1
 152 006a C046     		nop
 153 006c BD46     		mov	sp, r7
 154 006e 04B0     		add	sp, sp, #16
 155              		@ sp needed
 156 0070 80BD     		pop	{r7, pc}
 157              		.cfi_endproc
 158              	.LFE2:
 160              		.align	1
 161              		.global	clear_object
 162              		.syntax unified
 163              		.code	16
 164              		.thumb_func
 165              		.fpu softvfp
 167              	clear_object:
 168              	.LFB3:
  49:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  50:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void clear_object(POBJECT o) {
 169              		.loc 1 50 0
 170              		.cfi_startproc
 171              		@ args = 0, pretend = 0, frame = 16
 172              		@ frame_needed = 1, uses_anonymous_args = 0
 173 0072 80B5     		push	{r7, lr}
 174              		.cfi_def_cfa_offset 8
 175              		.cfi_offset 7, -8
 176              		.cfi_offset 14, -4
 177 0074 84B0     		sub	sp, sp, #16
 178              		.cfi_def_cfa_offset 24
 179 0076 00AF     		add	r7, sp, #0
 180              		.cfi_def_cfa_register 7
 181 0078 7860     		str	r0, [r7, #4]
 182              	.LBB3:
  51:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 183              		.loc 1 51 0
 184 007a 0023     		movs	r3, #0
 185 007c FB60     		str	r3, [r7, #12]
 186 007e 17E0     		b	.L7
 187              	.L8:
  52:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		pixel(o->geo->px[i].x, o->geo->px[i].y, 0);
 188              		.loc 1 52 0 discriminator 3
 189 0080 7B68     		ldr	r3, [r7, #4]
 190 0082 1A68     		ldr	r2, [r3]
 191 0084 FB68     		ldr	r3, [r7, #12]
 192 0086 0433     		adds	r3, r3, #4
 193 0088 5B00     		lsls	r3, r3, #1
 194 008a D318     		adds	r3, r2, r3
 195 008c 0433     		adds	r3, r3, #4
 196 008e 1B78     		ldrb	r3, [r3]
 197 0090 1800     		movs	r0, r3
 198 0092 7B68     		ldr	r3, [r7, #4]
 199 0094 1A68     		ldr	r2, [r3]
 200 0096 FB68     		ldr	r3, [r7, #12]
 201 0098 0433     		adds	r3, r3, #4
 202 009a 5B00     		lsls	r3, r3, #1
 203 009c D318     		adds	r3, r2, r3
 204 009e 0533     		adds	r3, r3, #5
 205 00a0 1B78     		ldrb	r3, [r3]
 206 00a2 0022     		movs	r2, #0
 207 00a4 1900     		movs	r1, r3
 208 00a6 FFF7FEFF 		bl	pixel
  51:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 209              		.loc 1 51 0 discriminator 3
 210 00aa FB68     		ldr	r3, [r7, #12]
 211 00ac 0133     		adds	r3, r3, #1
 212 00ae FB60     		str	r3, [r7, #12]
 213              	.L7:
  51:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 214              		.loc 1 51 0 is_stmt 0 discriminator 1
 215 00b0 7B68     		ldr	r3, [r7, #4]
 216 00b2 1B68     		ldr	r3, [r3]
 217 00b4 1B68     		ldr	r3, [r3]
 218 00b6 FA68     		ldr	r2, [r7, #12]
 219 00b8 9A42     		cmp	r2, r3
 220 00ba E1DB     		blt	.L8
 221              	.LBE3:
  53:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
  54:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 222              		.loc 1 54 0 is_stmt 1
 223 00bc C046     		nop
 224 00be BD46     		mov	sp, r7
 225 00c0 04B0     		add	sp, sp, #16
 226              		@ sp needed
 227 00c2 80BD     		pop	{r7, pc}
 228              		.cfi_endproc
 229              	.LFE3:
 231              		.align	1
 232              		.global	move_object
 233              		.syntax unified
 234              		.code	16
 235              		.thumb_func
 236              		.fpu softvfp
 238              	move_object:
 239              	.LFB4:
  55:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  56:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void move_object(POBJECT o) {
 240              		.loc 1 56 0
 241              		.cfi_startproc
 242              		@ args = 0, pretend = 0, frame = 16
 243              		@ frame_needed = 1, uses_anonymous_args = 0
 244 00c4 80B5     		push	{r7, lr}
 245              		.cfi_def_cfa_offset 8
 246              		.cfi_offset 7, -8
 247              		.cfi_offset 14, -4
 248 00c6 84B0     		sub	sp, sp, #16
 249              		.cfi_def_cfa_offset 24
 250 00c8 00AF     		add	r7, sp, #0
 251              		.cfi_def_cfa_register 7
 252 00ca 7860     		str	r0, [r7, #4]
  57:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	clear_object(o);
 253              		.loc 1 57 0
 254 00cc 7B68     		ldr	r3, [r7, #4]
 255 00ce 1800     		movs	r0, r3
 256 00d0 FFF7FEFF 		bl	clear_object
 257              	.LBB4:
  58:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
  59:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++) {
 258              		.loc 1 59 0
 259 00d4 0023     		movs	r3, #0
 260 00d6 FB60     		str	r3, [r7, #12]
 261 00d8 2EE0     		b	.L10
 262              	.L11:
  60:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 263              		.loc 1 60 0 discriminator 3
 264 00da 7B68     		ldr	r3, [r7, #4]
 265 00dc 1A68     		ldr	r2, [r3]
 266 00de FB68     		ldr	r3, [r7, #12]
 267 00e0 0433     		adds	r3, r3, #4
 268 00e2 5B00     		lsls	r3, r3, #1
 269 00e4 D318     		adds	r3, r2, r3
 270 00e6 0433     		adds	r3, r3, #4
 271 00e8 1878     		ldrb	r0, [r3]
 272 00ea 7B68     		ldr	r3, [r7, #4]
 273 00ec 5B68     		ldr	r3, [r3, #4]
 274 00ee D9B2     		uxtb	r1, r3
 275 00f0 7B68     		ldr	r3, [r7, #4]
 276 00f2 1A68     		ldr	r2, [r3]
 277 00f4 4318     		adds	r3, r0, r1
 278 00f6 D9B2     		uxtb	r1, r3
 279 00f8 FB68     		ldr	r3, [r7, #12]
 280 00fa 0433     		adds	r3, r3, #4
 281 00fc 5B00     		lsls	r3, r3, #1
 282 00fe D318     		adds	r3, r2, r3
 283 0100 0433     		adds	r3, r3, #4
 284 0102 0A1C     		adds	r2, r1, #0
 285 0104 1A70     		strb	r2, [r3]
  61:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].y += o->diry;
 286              		.loc 1 61 0 discriminator 3
 287 0106 7B68     		ldr	r3, [r7, #4]
 288 0108 1A68     		ldr	r2, [r3]
 289 010a FB68     		ldr	r3, [r7, #12]
 290 010c 0433     		adds	r3, r3, #4
 291 010e 5B00     		lsls	r3, r3, #1
 292 0110 D318     		adds	r3, r2, r3
 293 0112 0533     		adds	r3, r3, #5
 294 0114 1878     		ldrb	r0, [r3]
 295 0116 7B68     		ldr	r3, [r7, #4]
 296 0118 9B68     		ldr	r3, [r3, #8]
 297 011a D9B2     		uxtb	r1, r3
 298 011c 7B68     		ldr	r3, [r7, #4]
 299 011e 1A68     		ldr	r2, [r3]
 300 0120 4318     		adds	r3, r0, r1
 301 0122 D9B2     		uxtb	r1, r3
 302 0124 FB68     		ldr	r3, [r7, #12]
 303 0126 0433     		adds	r3, r3, #4
 304 0128 5B00     		lsls	r3, r3, #1
 305 012a D318     		adds	r3, r2, r3
 306 012c 0533     		adds	r3, r3, #5
 307 012e 0A1C     		adds	r2, r1, #0
 308 0130 1A70     		strb	r2, [r3]
  59:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 309              		.loc 1 59 0 discriminator 3
 310 0132 FB68     		ldr	r3, [r7, #12]
 311 0134 0133     		adds	r3, r3, #1
 312 0136 FB60     		str	r3, [r7, #12]
 313              	.L10:
  59:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->geo->px[i].x += o->dirx;
 314              		.loc 1 59 0 is_stmt 0 discriminator 1
 315 0138 7B68     		ldr	r3, [r7, #4]
 316 013a 1B68     		ldr	r3, [r3]
 317 013c 1B68     		ldr	r3, [r3]
 318 013e FA68     		ldr	r2, [r7, #12]
 319 0140 9A42     		cmp	r2, r3
 320 0142 CADB     		blt	.L11
 321              	.LBE4:
  62:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
  63:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->posx += o->dirx;
 322              		.loc 1 63 0 is_stmt 1
 323 0144 7B68     		ldr	r3, [r7, #4]
 324 0146 DA68     		ldr	r2, [r3, #12]
 325 0148 7B68     		ldr	r3, [r7, #4]
 326 014a 5B68     		ldr	r3, [r3, #4]
 327 014c D218     		adds	r2, r2, r3
 328 014e 7B68     		ldr	r3, [r7, #4]
 329 0150 DA60     		str	r2, [r3, #12]
  64:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	o->posy += o->diry;
 330              		.loc 1 64 0
 331 0152 7B68     		ldr	r3, [r7, #4]
 332 0154 1A69     		ldr	r2, [r3, #16]
 333 0156 7B68     		ldr	r3, [r7, #4]
 334 0158 9B68     		ldr	r3, [r3, #8]
 335 015a D218     		adds	r2, r2, r3
 336 015c 7B68     		ldr	r3, [r7, #4]
 337 015e 1A61     		str	r2, [r3, #16]
  65:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
  66:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(o->posx < 1)
 338              		.loc 1 66 0
 339 0160 7B68     		ldr	r3, [r7, #4]
 340 0162 DB68     		ldr	r3, [r3, #12]
 341 0164 002B     		cmp	r3, #0
 342 0166 04DC     		bgt	.L12
  67:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->dirx *= -1;
 343              		.loc 1 67 0
 344 0168 7B68     		ldr	r3, [r7, #4]
 345 016a 5B68     		ldr	r3, [r3, #4]
 346 016c 5A42     		rsbs	r2, r3, #0
 347 016e 7B68     		ldr	r3, [r7, #4]
 348 0170 5A60     		str	r2, [r3, #4]
 349              	.L12:
  68:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if((o->posx + o->geo->sizex) > 128)
 350              		.loc 1 68 0
 351 0172 7B68     		ldr	r3, [r7, #4]
 352 0174 DA68     		ldr	r2, [r3, #12]
 353 0176 7B68     		ldr	r3, [r7, #4]
 354 0178 1B68     		ldr	r3, [r3]
 355 017a 5B68     		ldr	r3, [r3, #4]
 356 017c D318     		adds	r3, r2, r3
 357 017e 802B     		cmp	r3, #128
 358 0180 04DD     		ble	.L13
  69:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->dirx *= -1;
 359              		.loc 1 69 0
 360 0182 7B68     		ldr	r3, [r7, #4]
 361 0184 5B68     		ldr	r3, [r3, #4]
 362 0186 5A42     		rsbs	r2, r3, #0
 363 0188 7B68     		ldr	r3, [r7, #4]
 364 018a 5A60     		str	r2, [r3, #4]
 365              	.L13:
  70:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(o->posy < 1)
 366              		.loc 1 70 0
 367 018c 7B68     		ldr	r3, [r7, #4]
 368 018e 1B69     		ldr	r3, [r3, #16]
 369 0190 002B     		cmp	r3, #0
 370 0192 04DC     		bgt	.L14
  71:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->diry *= -1;
 371              		.loc 1 71 0
 372 0194 7B68     		ldr	r3, [r7, #4]
 373 0196 9B68     		ldr	r3, [r3, #8]
 374 0198 5A42     		rsbs	r2, r3, #0
 375 019a 7B68     		ldr	r3, [r7, #4]
 376 019c 9A60     		str	r2, [r3, #8]
 377              	.L14:
  72:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if((o->posy + o->geo->sizey) > 64)
 378              		.loc 1 72 0
 379 019e 7B68     		ldr	r3, [r7, #4]
 380 01a0 1A69     		ldr	r2, [r3, #16]
 381 01a2 7B68     		ldr	r3, [r7, #4]
 382 01a4 1B68     		ldr	r3, [r3]
 383 01a6 9B68     		ldr	r3, [r3, #8]
 384 01a8 D318     		adds	r3, r2, r3
 385 01aa 402B     		cmp	r3, #64
 386 01ac 04DD     		ble	.L15
  73:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		o->diry *= -1;
 387              		.loc 1 73 0
 388 01ae 7B68     		ldr	r3, [r7, #4]
 389 01b0 9B68     		ldr	r3, [r3, #8]
 390 01b2 5A42     		rsbs	r2, r3, #0
 391 01b4 7B68     		ldr	r3, [r7, #4]
 392 01b6 9A60     		str	r2, [r3, #8]
 393              	.L15:
  74:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		
  75:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	draw_object(o);
 394              		.loc 1 75 0
 395 01b8 7B68     		ldr	r3, [r7, #4]
 396 01ba 1800     		movs	r0, r3
 397 01bc FFF7FEFF 		bl	draw_object
  76:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 398              		.loc 1 76 0
 399 01c0 C046     		nop
 400 01c2 BD46     		mov	sp, r7
 401 01c4 04B0     		add	sp, sp, #16
 402              		@ sp needed
 403 01c6 80BD     		pop	{r7, pc}
 404              		.cfi_endproc
 405              	.LFE4:
 407              		.align	1
 408              		.global	delay_250ns
 409              		.syntax unified
 410              		.code	16
 411              		.thumb_func
 412              		.fpu softvfp
 414              	delay_250ns:
 415              	.LFB5:
  77:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  78:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_250ns(void) {
 416              		.loc 1 78 0
 417              		.cfi_startproc
 418              		@ args = 0, pretend = 0, frame = 0
 419              		@ frame_needed = 1, uses_anonymous_args = 0
 420 01c8 80B5     		push	{r7, lr}
 421              		.cfi_def_cfa_offset 8
 422              		.cfi_offset 7, -8
 423              		.cfi_offset 14, -4
 424 01ca 00AF     		add	r7, sp, #0
 425              		.cfi_def_cfa_register 7
  79:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_CTRL = 0;				// clear SysTik
 426              		.loc 1 79 0
 427 01cc 0C4B     		ldr	r3, .L18
 428 01ce 0022     		movs	r2, #0
 429 01d0 1A60     		str	r2, [r3]
  80:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_LOAD = 41;				// initialize with 42 cycles
 430              		.loc 1 80 0
 431 01d2 0C4B     		ldr	r3, .L18+4
 432 01d4 2922     		movs	r2, #41
 433 01d6 1A60     		str	r2, [r3]
  81:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_VAL = 0;				// clear countregister
 434              		.loc 1 81 0
 435 01d8 0B4B     		ldr	r3, .L18+8
 436 01da 0022     		movs	r2, #0
 437 01dc 1A60     		str	r2, [r3]
  82:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_CTRL = 5;				// reset counter
 438              		.loc 1 82 0
 439 01de 084B     		ldr	r3, .L18
 440 01e0 0522     		movs	r2, #5
 441 01e2 1A60     		str	r2, [r3]
  83:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	while ((*STK_CTRL & 0x00010000) == 0) {}	// wait until COUNTFLAG = 1
 442              		.loc 1 83 0
 443 01e4 C046     		nop
 444              	.L17:
 445              		.loc 1 83 0 is_stmt 0 discriminator 1
 446 01e6 064B     		ldr	r3, .L18
 447 01e8 1A68     		ldr	r2, [r3]
 448 01ea 8023     		movs	r3, #128
 449 01ec 5B02     		lsls	r3, r3, #9
 450 01ee 1340     		ands	r3, r2
 451 01f0 F9D0     		beq	.L17
  84:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	*STK_CTRL = 0;				// clear SysTik
 452              		.loc 1 84 0 is_stmt 1
 453 01f2 034B     		ldr	r3, .L18
 454 01f4 0022     		movs	r2, #0
 455 01f6 1A60     		str	r2, [r3]
  85:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 456              		.loc 1 85 0
 457 01f8 C046     		nop
 458 01fa BD46     		mov	sp, r7
 459              		@ sp needed
 460 01fc 80BD     		pop	{r7, pc}
 461              	.L19:
 462 01fe C046     		.align	2
 463              	.L18:
 464 0200 10E000E0 		.word	-536813552
 465 0204 14E000E0 		.word	-536813548
 466 0208 18E000E0 		.word	-536813544
 467              		.cfi_endproc
 468              	.LFE5:
 470              		.align	1
 471              		.global	delay_500ns
 472              		.syntax unified
 473              		.code	16
 474              		.thumb_func
 475              		.fpu softvfp
 477              	delay_500ns:
 478              	.LFB6:
  86:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  87:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_500ns(void) {
 479              		.loc 1 87 0
 480              		.cfi_startproc
 481              		@ args = 0, pretend = 0, frame = 0
 482              		@ frame_needed = 1, uses_anonymous_args = 0
 483 020c 80B5     		push	{r7, lr}
 484              		.cfi_def_cfa_offset 8
 485              		.cfi_offset 7, -8
 486              		.cfi_offset 14, -4
 487 020e 00AF     		add	r7, sp, #0
 488              		.cfi_def_cfa_register 7
  88:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_250ns();
 489              		.loc 1 88 0
 490 0210 FFF7FEFF 		bl	delay_250ns
  89:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	delay_250ns();
 491              		.loc 1 89 0
 492 0214 FFF7FEFF 		bl	delay_250ns
  90:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 493              		.loc 1 90 0
 494 0218 C046     		nop
 495 021a BD46     		mov	sp, r7
 496              		@ sp needed
 497 021c 80BD     		pop	{r7, pc}
 498              		.cfi_endproc
 499              	.LFE6:
 501              		.align	1
 502              		.global	delay_micro
 503              		.syntax unified
 504              		.code	16
 505              		.thumb_func
 506              		.fpu softvfp
 508              	delay_micro:
 509              	.LFB7:
  91:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
  92:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_micro(unsigned int us) {
 510              		.loc 1 92 0
 511              		.cfi_startproc
 512              		@ args = 0, pretend = 0, frame = 8
 513              		@ frame_needed = 1, uses_anonymous_args = 0
 514 021e 80B5     		push	{r7, lr}
 515              		.cfi_def_cfa_offset 8
 516              		.cfi_offset 7, -8
 517              		.cfi_offset 14, -4
 518 0220 82B0     		sub	sp, sp, #8
 519              		.cfi_def_cfa_offset 16
 520 0222 00AF     		add	r7, sp, #0
 521              		.cfi_def_cfa_register 7
 522 0224 7860     		str	r0, [r7, #4]
  93:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	while(us--) {
 523              		.loc 1 93 0
 524 0226 07E0     		b	.L22
 525              	.L23:
  94:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 526              		.loc 1 94 0
 527 0228 FFF7FEFF 		bl	delay_250ns
  95:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 528              		.loc 1 95 0
 529 022c FFF7FEFF 		bl	delay_250ns
  96:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 530              		.loc 1 96 0
 531 0230 FFF7FEFF 		bl	delay_250ns
  97:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 532              		.loc 1 97 0
 533 0234 FFF7FEFF 		bl	delay_250ns
 534              	.L22:
  93:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		delay_250ns();
 535              		.loc 1 93 0
 536 0238 7B68     		ldr	r3, [r7, #4]
 537 023a 5A1E     		subs	r2, r3, #1
 538 023c 7A60     		str	r2, [r7, #4]
 539 023e 002B     		cmp	r3, #0
 540 0240 F2D1     		bne	.L23
  98:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	} 
  99:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 541              		.loc 1 99 0
 542 0242 C046     		nop
 543 0244 BD46     		mov	sp, r7
 544 0246 02B0     		add	sp, sp, #8
 545              		@ sp needed
 546 0248 80BD     		pop	{r7, pc}
 547              		.cfi_endproc
 548              	.LFE7:
 550              		.align	1
 551              		.global	delay_milli
 552              		.syntax unified
 553              		.code	16
 554              		.thumb_func
 555              		.fpu softvfp
 557              	delay_milli:
 558              	.LFB8:
 100:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 101:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void delay_milli(unsigned int ms) {
 559              		.loc 1 101 0
 560              		.cfi_startproc
 561              		@ args = 0, pretend = 0, frame = 8
 562              		@ frame_needed = 1, uses_anonymous_args = 0
 563 024a 80B5     		push	{r7, lr}
 564              		.cfi_def_cfa_offset 8
 565              		.cfi_offset 7, -8
 566              		.cfi_offset 14, -4
 567 024c 82B0     		sub	sp, sp, #8
 568              		.cfi_def_cfa_offset 16
 569 024e 00AF     		add	r7, sp, #0
 570              		.cfi_def_cfa_register 7
 571 0250 7860     		str	r0, [r7, #4]
 102:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //	#ifdef SIMULATOR
 103:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		while( ms-- )
 572              		.loc 1 103 0
 573 0252 02E0     		b	.L25
 574              	.L26:
 104:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			delay_micro(1);
 575              		.loc 1 104 0
 576 0254 0120     		movs	r0, #1
 577 0256 FFF7FEFF 		bl	delay_micro
 578              	.L25:
 103:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			delay_micro(1);
 579              		.loc 1 103 0
 580 025a 7B68     		ldr	r3, [r7, #4]
 581 025c 5A1E     		subs	r2, r3, #1
 582 025e 7A60     		str	r2, [r7, #4]
 583 0260 002B     		cmp	r3, #0
 584 0262 F7D1     		bne	.L26
 105:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //	#else
 106:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //		while( ms-- )
 107:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //			delay_micro(1000);
 108:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** //	#endif
 109:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 585              		.loc 1 109 0
 586 0264 C046     		nop
 587 0266 BD46     		mov	sp, r7
 588 0268 02B0     		add	sp, sp, #8
 589              		@ sp needed
 590 026a 80BD     		pop	{r7, pc}
 591              		.cfi_endproc
 592              	.LFE8:
 594              		.align	1
 595              		.global	kbdActivate
 596              		.syntax unified
 597              		.code	16
 598              		.thumb_func
 599              		.fpu softvfp
 601              	kbdActivate:
 602              	.LFB9:
 110:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 111:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void kbdActivate(unsigned int row){
 603              		.loc 1 111 0
 604              		.cfi_startproc
 605              		@ args = 0, pretend = 0, frame = 8
 606              		@ frame_needed = 1, uses_anonymous_args = 0
 607 026c 80B5     		push	{r7, lr}
 608              		.cfi_def_cfa_offset 8
 609              		.cfi_offset 7, -8
 610              		.cfi_offset 14, -4
 611 026e 82B0     		sub	sp, sp, #8
 612              		.cfi_def_cfa_offset 16
 613 0270 00AF     		add	r7, sp, #0
 614              		.cfi_def_cfa_register 7
 615 0272 7860     		str	r0, [r7, #4]
 112:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	switch(row){
 616              		.loc 1 112 0
 617 0274 7B68     		ldr	r3, [r7, #4]
 618 0276 042B     		cmp	r3, #4
 619 0278 19D8     		bhi	.L35
 620 027a 7B68     		ldr	r3, [r7, #4]
 621 027c 9A00     		lsls	r2, r3, #2
 622 027e 0E4B     		ldr	r3, .L36
 623 0280 D318     		adds	r3, r2, r3
 624 0282 1B68     		ldr	r3, [r3]
 625 0284 9F46     		mov	pc, r3
 626              		.section	.rodata
 627              		.align	2
 628              	.L30:
 629 0000 A6020000 		.word	.L29
 630 0004 86020000 		.word	.L31
 631 0008 8E020000 		.word	.L32
 632 000c 96020000 		.word	.L33
 633 0010 9E020000 		.word	.L34
 634              		.text
 635              	.L31:
 113:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case 1: GPIO_D->odrHigh = 0x10; break;
 636              		.loc 1 113 0
 637 0286 0D4B     		ldr	r3, .L36+4
 638 0288 1022     		movs	r2, #16
 639 028a 5A75     		strb	r2, [r3, #21]
 640 028c 0FE0     		b	.L28
 641              	.L32:
 114:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case 2: GPIO_D->odrHigh = 0x20; break;
 642              		.loc 1 114 0
 643 028e 0B4B     		ldr	r3, .L36+4
 644 0290 2022     		movs	r2, #32
 645 0292 5A75     		strb	r2, [r3, #21]
 646 0294 0BE0     		b	.L28
 647              	.L33:
 115:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case 3: GPIO_D->odrHigh = 0x40; break;
 648              		.loc 1 115 0
 649 0296 094B     		ldr	r3, .L36+4
 650 0298 4022     		movs	r2, #64
 651 029a 5A75     		strb	r2, [r3, #21]
 652 029c 07E0     		b	.L28
 653              	.L34:
 116:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case 4: GPIO_D->odrHigh = 0x80; break;
 654              		.loc 1 116 0
 655 029e 074B     		ldr	r3, .L36+4
 656 02a0 8022     		movs	r2, #128
 657 02a2 5A75     		strb	r2, [r3, #21]
 658 02a4 03E0     		b	.L28
 659              	.L29:
 117:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		case 0: GPIO_D->odrHigh = 0x00; break;
 660              		.loc 1 117 0
 661 02a6 054B     		ldr	r3, .L36+4
 662 02a8 0022     		movs	r2, #0
 663 02aa 5A75     		strb	r2, [r3, #21]
 664 02ac C046     		nop
 665              	.L28:
 666              	.L35:
 118:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 119:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 667              		.loc 1 119 0
 668 02ae C046     		nop
 669 02b0 BD46     		mov	sp, r7
 670 02b2 02B0     		add	sp, sp, #8
 671              		@ sp needed
 672 02b4 80BD     		pop	{r7, pc}
 673              	.L37:
 674 02b6 C046     		.align	2
 675              	.L36:
 676 02b8 00000000 		.word	.L30
 677 02bc 000C0240 		.word	1073875968
 678              		.cfi_endproc
 679              	.LFE9:
 681              		.align	1
 682              		.global	kbdGetCol
 683              		.syntax unified
 684              		.code	16
 685              		.thumb_func
 686              		.fpu softvfp
 688              	kbdGetCol:
 689              	.LFB10:
 120:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 121:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** int kbdGetCol(void){
 690              		.loc 1 121 0
 691              		.cfi_startproc
 692              		@ args = 0, pretend = 0, frame = 8
 693              		@ frame_needed = 1, uses_anonymous_args = 0
 694 02c0 80B5     		push	{r7, lr}
 695              		.cfi_def_cfa_offset 8
 696              		.cfi_offset 7, -8
 697              		.cfi_offset 14, -4
 698 02c2 82B0     		sub	sp, sp, #8
 699              		.cfi_def_cfa_offset 16
 700 02c4 00AF     		add	r7, sp, #0
 701              		.cfi_def_cfa_register 7
 122:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned char c;
 123:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	c = GPIO_D->idrHigh;
 702              		.loc 1 123 0
 703 02c6 124A     		ldr	r2, .L44
 704 02c8 FB1D     		adds	r3, r7, #7
 705 02ca 527C     		ldrb	r2, [r2, #17]
 706 02cc 1A70     		strb	r2, [r3]
 124:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(c & 0x8) return 4;
 707              		.loc 1 124 0
 708 02ce FB1D     		adds	r3, r7, #7
 709 02d0 1B78     		ldrb	r3, [r3]
 710 02d2 0822     		movs	r2, #8
 711 02d4 1340     		ands	r3, r2
 712 02d6 01D0     		beq	.L39
 713              		.loc 1 124 0 is_stmt 0 discriminator 1
 714 02d8 0423     		movs	r3, #4
 715 02da 15E0     		b	.L40
 716              	.L39:
 125:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(c & 0x4) return 3;
 717              		.loc 1 125 0 is_stmt 1
 718 02dc FB1D     		adds	r3, r7, #7
 719 02de 1B78     		ldrb	r3, [r3]
 720 02e0 0422     		movs	r2, #4
 721 02e2 1340     		ands	r3, r2
 722 02e4 01D0     		beq	.L41
 723              		.loc 1 125 0 is_stmt 0 discriminator 1
 724 02e6 0323     		movs	r3, #3
 725 02e8 0EE0     		b	.L40
 726              	.L41:
 126:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(c & 0x2) return 2;
 727              		.loc 1 126 0 is_stmt 1
 728 02ea FB1D     		adds	r3, r7, #7
 729 02ec 1B78     		ldrb	r3, [r3]
 730 02ee 0222     		movs	r2, #2
 731 02f0 1340     		ands	r3, r2
 732 02f2 01D0     		beq	.L42
 733              		.loc 1 126 0 is_stmt 0 discriminator 1
 734 02f4 0223     		movs	r3, #2
 735 02f6 07E0     		b	.L40
 736              	.L42:
 127:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	if(c & 0x1) return 1;
 737              		.loc 1 127 0 is_stmt 1
 738 02f8 FB1D     		adds	r3, r7, #7
 739 02fa 1B78     		ldrb	r3, [r3]
 740 02fc 0122     		movs	r2, #1
 741 02fe 1340     		ands	r3, r2
 742 0300 01D0     		beq	.L43
 743              		.loc 1 127 0 is_stmt 0 discriminator 1
 744 0302 0123     		movs	r3, #1
 745 0304 00E0     		b	.L40
 746              	.L43:
 128:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	return 0;
 747              		.loc 1 128 0 is_stmt 1
 748 0306 0023     		movs	r3, #0
 749              	.L40:
 129:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 750              		.loc 1 129 0
 751 0308 1800     		movs	r0, r3
 752 030a BD46     		mov	sp, r7
 753 030c 02B0     		add	sp, sp, #8
 754              		@ sp needed
 755 030e 80BD     		pop	{r7, pc}
 756              	.L45:
 757              		.align	2
 758              	.L44:
 759 0310 000C0240 		.word	1073875968
 760              		.cfi_endproc
 761              	.LFE10:
 763              		.section	.rodata
 764              		.align	2
 765              	.LC0:
 766 0014 01       		.byte	1
 767 0015 02       		.byte	2
 768 0016 03       		.byte	3
 769 0017 0A       		.byte	10
 770 0018 04       		.byte	4
 771 0019 05       		.byte	5
 772 001a 06       		.byte	6
 773 001b 0B       		.byte	11
 774 001c 07       		.byte	7
 775 001d 08       		.byte	8
 776 001e 09       		.byte	9
 777 001f 0C       		.byte	12
 778 0020 0E       		.byte	14
 779 0021 00       		.byte	0
 780 0022 0F       		.byte	15
 781 0023 0D       		.byte	13
 782              		.text
 783              		.align	1
 784              		.global	keyb
 785              		.syntax unified
 786              		.code	16
 787              		.thumb_func
 788              		.fpu softvfp
 790              	keyb:
 791              	.LFB11:
 130:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 131:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** unsigned char keyb(void){
 792              		.loc 1 131 0
 793              		.cfi_startproc
 794              		@ args = 0, pretend = 0, frame = 24
 795              		@ frame_needed = 1, uses_anonymous_args = 0
 796 0314 90B5     		push	{r4, r7, lr}
 797              		.cfi_def_cfa_offset 12
 798              		.cfi_offset 4, -12
 799              		.cfi_offset 7, -8
 800              		.cfi_offset 14, -4
 801 0316 87B0     		sub	sp, sp, #28
 802              		.cfi_def_cfa_offset 40
 803 0318 00AF     		add	r7, sp, #0
 804              		.cfi_def_cfa_register 7
 132:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	unsigned char key[] = {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 805              		.loc 1 132 0
 806 031a 3B00     		movs	r3, r7
 807 031c 164A     		ldr	r2, .L52
 808 031e 13CA     		ldmia	r2!, {r0, r1, r4}
 809 0320 13C3     		stmia	r3!, {r0, r1, r4}
 810 0322 1268     		ldr	r2, [r2]
 811 0324 1A60     		str	r2, [r3]
 133:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int row, col;
 134:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	for(row = 1; row <= 4; row++){
 812              		.loc 1 134 0
 813 0326 0123     		movs	r3, #1
 814 0328 7B61     		str	r3, [r7, #20]
 815 032a 19E0     		b	.L47
 816              	.L50:
 135:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		kbdActivate(row);
 817              		.loc 1 135 0
 818 032c 7B69     		ldr	r3, [r7, #20]
 819 032e 1800     		movs	r0, r3
 820 0330 FFF7FEFF 		bl	kbdActivate
 136:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		if(col = kbdGetCol()){
 821              		.loc 1 136 0
 822 0334 FFF7FEFF 		bl	kbdGetCol
 823 0338 0300     		movs	r3, r0
 824 033a 3B61     		str	r3, [r7, #16]
 825 033c 3B69     		ldr	r3, [r7, #16]
 826 033e 002B     		cmp	r3, #0
 827 0340 0BD0     		beq	.L48
 137:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			kbdActivate(0);
 828              		.loc 1 137 0
 829 0342 0020     		movs	r0, #0
 830 0344 FFF7FEFF 		bl	kbdActivate
 138:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			return key [4*(row-1)+(col-1)];
 831              		.loc 1 138 0
 832 0348 7B69     		ldr	r3, [r7, #20]
 833 034a 013B     		subs	r3, r3, #1
 834 034c 9A00     		lsls	r2, r3, #2
 835 034e 3B69     		ldr	r3, [r7, #16]
 836 0350 013B     		subs	r3, r3, #1
 837 0352 D318     		adds	r3, r2, r3
 838 0354 3A00     		movs	r2, r7
 839 0356 D35C     		ldrb	r3, [r2, r3]
 840 0358 09E0     		b	.L51
 841              	.L48:
 134:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		kbdActivate(row);
 842              		.loc 1 134 0 discriminator 2
 843 035a 7B69     		ldr	r3, [r7, #20]
 844 035c 0133     		adds	r3, r3, #1
 845 035e 7B61     		str	r3, [r7, #20]
 846              	.L47:
 134:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		kbdActivate(row);
 847              		.loc 1 134 0 is_stmt 0 discriminator 1
 848 0360 7B69     		ldr	r3, [r7, #20]
 849 0362 042B     		cmp	r3, #4
 850 0364 E2DD     		ble	.L50
 139:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		}
 140:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 141:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	kbdActivate(0);
 851              		.loc 1 141 0 is_stmt 1
 852 0366 0020     		movs	r0, #0
 853 0368 FFF7FEFF 		bl	kbdActivate
 142:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	return 0xFF;
 854              		.loc 1 142 0
 855 036c FF23     		movs	r3, #255
 856              	.L51:
 143:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 857              		.loc 1 143 0 discriminator 1
 858 036e 1800     		movs	r0, r3
 859 0370 BD46     		mov	sp, r7
 860 0372 07B0     		add	sp, sp, #28
 861              		@ sp needed
 862 0374 90BD     		pop	{r4, r7, pc}
 863              	.L53:
 864 0376 C046     		.align	2
 865              	.L52:
 866 0378 14000000 		.word	.LC0
 867              		.cfi_endproc
 868              	.LFE11:
 870              		.align	1
 871              		.global	init_app
 872              		.syntax unified
 873              		.code	16
 874              		.thumb_func
 875              		.fpu softvfp
 877              	init_app:
 878              	.LFB12:
 144:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 145:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void init_app(void) {
 879              		.loc 1 145 0
 880              		.cfi_startproc
 881              		@ args = 0, pretend = 0, frame = 0
 882              		@ frame_needed = 1, uses_anonymous_args = 0
 883 037c 80B5     		push	{r7, lr}
 884              		.cfi_def_cfa_offset 8
 885              		.cfi_offset 7, -8
 886              		.cfi_offset 14, -4
 887 037e 00AF     		add	r7, sp, #0
 888              		.cfi_def_cfa_register 7
 146:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	// Display init
 147:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_E->moder = 0x55555555;
 889              		.loc 1 147 0
 890 0380 0B4B     		ldr	r3, .L55
 891 0382 0C4A     		ldr	r2, .L55+4
 892 0384 1A60     		str	r2, [r3]
 148:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 149:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	// Keypad init
 150:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_D->moder = 0x55005555;
 893              		.loc 1 150 0
 894 0386 0C4B     		ldr	r3, .L55+8
 895 0388 0C4A     		ldr	r2, .L55+12
 896 038a 1A60     		str	r2, [r3]
 151:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_D->otyper &= 0x0FFF;
 897              		.loc 1 151 0
 898 038c 0A4B     		ldr	r3, .L55+8
 899 038e 9B88     		ldrh	r3, [r3, #4]
 900 0390 9BB2     		uxth	r3, r3
 901 0392 094A     		ldr	r2, .L55+8
 902 0394 1B05     		lsls	r3, r3, #20
 903 0396 1B0D     		lsrs	r3, r3, #20
 904 0398 9BB2     		uxth	r3, r3
 905 039a 9380     		strh	r3, [r2, #4]
 152:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	GPIO_D->pupdr |= 0xAAAAAAAA;
 906              		.loc 1 152 0
 907 039c 064B     		ldr	r3, .L55+8
 908 039e DA68     		ldr	r2, [r3, #12]
 909 03a0 054B     		ldr	r3, .L55+8
 910 03a2 0749     		ldr	r1, .L55+16
 911 03a4 0A43     		orrs	r2, r1
 912 03a6 DA60     		str	r2, [r3, #12]
 153:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** }
 913              		.loc 1 153 0
 914 03a8 C046     		nop
 915 03aa BD46     		mov	sp, r7
 916              		@ sp needed
 917 03ac 80BD     		pop	{r7, pc}
 918              	.L56:
 919 03ae C046     		.align	2
 920              	.L55:
 921 03b0 00100240 		.word	1073876992
 922 03b4 55555555 		.word	1431655765
 923 03b8 000C0240 		.word	1073875968
 924 03bc 55550055 		.word	1426085205
 925 03c0 AAAAAAAA 		.word	-1431655766
 926              		.cfi_endproc
 927              	.LFE12:
 929              		.global	ball_geometry
 930              		.data
 931              		.align	2
 934              	ball_geometry:
 935 0000 0C000000 		.word	12
 936 0004 04000000 		.word	4
 937 0008 04000000 		.word	4
 938 000c 00       		.byte	0
 939 000d 01       		.byte	1
 940 000e 00       		.byte	0
 941 000f 02       		.byte	2
 942 0010 01       		.byte	1
 943 0011 00       		.byte	0
 944 0012 01       		.byte	1
 945 0013 01       		.byte	1
 946 0014 01       		.byte	1
 947 0015 02       		.byte	2
 948 0016 01       		.byte	1
 949 0017 03       		.byte	3
 950 0018 02       		.byte	2
 951 0019 00       		.byte	0
 952 001a 02       		.byte	2
 953 001b 01       		.byte	1
 954 001c 02       		.byte	2
 955 001d 02       		.byte	2
 956 001e 02       		.byte	2
 957 001f 03       		.byte	3
 958 0020 03       		.byte	3
 959 0021 01       		.byte	1
 960 0022 03       		.byte	3
 961 0023 02       		.byte	2
 962 0024 00000000 		.space	16
 962      00000000 
 962      00000000 
 962      00000000 
 963              		.global	ball
 964              		.align	2
 967              	ball:
 968 0034 00000000 		.word	ball_geometry
 969 0038 00000000 		.word	0
 970 003c 00000000 		.word	0
 971 0040 01000000 		.word	1
 972 0044 01000000 		.word	1
 973 0048 00000000 		.word	draw_object
 974 004c 00000000 		.word	clear_object
 975 0050 00000000 		.word	move_object
 976 0054 00000000 		.word	set_object_speed
 977              		.text
 978              		.align	1
 979              		.global	main
 980              		.syntax unified
 981              		.code	16
 982              		.thumb_func
 983              		.fpu softvfp
 985              	main:
 986              	.LFB13:
 154:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 155:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** GEOMETRY ball_geometry =
 156:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** {
 157:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	12,
 158:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	4,4,
 159:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	{
 160:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		{0,1}, {0,2}, {1,0}, {1,1}, {1,2},
 161:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		{1,3}, {2,0}, {2,1}, {2,2}, {2,3},
 162:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		{3,1}, {3,2}
 163:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	}
 164:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** };
 165:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	
 166:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** OBJECT ball =
 167:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** {
 168:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	&ball_geometry,
 169:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	0,0,
 170:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	1,1,
 171:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	draw_object,
 172:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	clear_object,
 173:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	move_object,
 174:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	set_object_speed
 175:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** };
 176:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 
 177:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** void main(void) {	
 987              		.loc 1 177 0
 988              		.cfi_startproc
 989              		@ args = 0, pretend = 0, frame = 8
 990              		@ frame_needed = 1, uses_anonymous_args = 0
 991 03c4 80B5     		push	{r7, lr}
 992              		.cfi_def_cfa_offset 8
 993              		.cfi_offset 7, -8
 994              		.cfi_offset 14, -4
 995 03c6 82B0     		sub	sp, sp, #8
 996              		.cfi_def_cfa_offset 16
 997 03c8 00AF     		add	r7, sp, #0
 998              		.cfi_def_cfa_register 7
 178:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	POBJECT p = &ball;
 999              		.loc 1 178 0
 1000 03ca 204B     		ldr	r3, .L65
 1001 03cc 7B60     		str	r3, [r7, #4]
 179:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	init_app();
 1002              		.loc 1 179 0
 1003 03ce FFF7FEFF 		bl	init_app
 180:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	graphic_initialize();
 1004              		.loc 1 180 0
 1005 03d2 FFF7FEFF 		bl	graphic_initialize
 181:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #ifndef SIMULATOR
 182:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	//graphic_clear_screen();
 183:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** #endif
 184:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	int speed = 10;
 1006              		.loc 1 184 0
 1007 03d6 0A23     		movs	r3, #10
 1008 03d8 3B60     		str	r3, [r7]
 185:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	p->set_speed(p, 4, 1);
 1009              		.loc 1 185 0
 1010 03da 7B68     		ldr	r3, [r7, #4]
 1011 03dc 1B6A     		ldr	r3, [r3, #32]
 1012 03de 7868     		ldr	r0, [r7, #4]
 1013 03e0 0122     		movs	r2, #1
 1014 03e2 0421     		movs	r1, #4
 1015 03e4 9847     		blx	r3
 1016              	.LVL0:
 1017              	.L64:
 186:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 	while(1) {
 187:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		p->move(p);
 1018              		.loc 1 187 0
 1019 03e6 7B68     		ldr	r3, [r7, #4]
 1020 03e8 DB69     		ldr	r3, [r3, #28]
 1021 03ea 7A68     		ldr	r2, [r7, #4]
 1022 03ec 1000     		movs	r0, r2
 1023 03ee 9847     		blx	r3
 1024              	.LVL1:
 188:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		//delay_milli(40);
 189:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		
 190:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		switch (keyb()) {
 1025              		.loc 1 190 0
 1026 03f0 FFF7FEFF 		bl	keyb
 1027 03f4 0300     		movs	r3, r0
 1028 03f6 042B     		cmp	r3, #4
 1029 03f8 10D0     		beq	.L59
 1030 03fa 02DC     		bgt	.L60
 1031 03fc 022B     		cmp	r3, #2
 1032 03fe 05D0     		beq	.L61
 1033 0400 22E0     		b	.L58
 1034              	.L60:
 1035 0402 062B     		cmp	r3, #6
 1036 0404 12D0     		beq	.L62
 1037 0406 082B     		cmp	r3, #8
 1038 0408 17D0     		beq	.L63
 1039 040a 1DE0     		b	.L58
 1040              	.L61:
 191:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			case 2: p->set_speed(p, 0, -speed); break;
 1041              		.loc 1 191 0
 1042 040c 7B68     		ldr	r3, [r7, #4]
 1043 040e 1B6A     		ldr	r3, [r3, #32]
 1044 0410 3A68     		ldr	r2, [r7]
 1045 0412 5242     		rsbs	r2, r2, #0
 1046 0414 7868     		ldr	r0, [r7, #4]
 1047 0416 0021     		movs	r1, #0
 1048 0418 9847     		blx	r3
 1049              	.LVL2:
 1050 041a 15E0     		b	.L58
 1051              	.L59:
 192:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			case 4: p->set_speed(p, -speed, 0); break;
 1052              		.loc 1 192 0
 1053 041c 7B68     		ldr	r3, [r7, #4]
 1054 041e 1B6A     		ldr	r3, [r3, #32]
 1055 0420 3A68     		ldr	r2, [r7]
 1056 0422 5142     		rsbs	r1, r2, #0
 1057 0424 7868     		ldr	r0, [r7, #4]
 1058 0426 0022     		movs	r2, #0
 1059 0428 9847     		blx	r3
 1060              	.LVL3:
 1061 042a 0DE0     		b	.L58
 1062              	.L62:
 193:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			case 6: p->set_speed(p, speed, 0); break;
 1063              		.loc 1 193 0
 1064 042c 7B68     		ldr	r3, [r7, #4]
 1065 042e 1B6A     		ldr	r3, [r3, #32]
 1066 0430 3968     		ldr	r1, [r7]
 1067 0432 7868     		ldr	r0, [r7, #4]
 1068 0434 0022     		movs	r2, #0
 1069 0436 9847     		blx	r3
 1070              	.LVL4:
 1071 0438 06E0     		b	.L58
 1072              	.L63:
 194:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 			case 8: p->set_speed(p, 0, speed); break;
 1073              		.loc 1 194 0
 1074 043a 7B68     		ldr	r3, [r7, #4]
 1075 043c 1B6A     		ldr	r3, [r3, #32]
 1076 043e 3A68     		ldr	r2, [r7]
 1077 0440 7868     		ldr	r0, [r7, #4]
 1078 0442 0021     		movs	r1, #0
 1079 0444 9847     		blx	r3
 1080              	.LVL5:
 1081 0446 C046     		nop
 1082              	.L58:
 187:C:/Users/johan/google_drive/Programmering/Git/Orm\startup.c **** 		//delay_milli(40);
 1083              		.loc 1 187 0
 1084 0448 CDE7     		b	.L64
 1085              	.L66:
 1086 044a C046     		.align	2
 1087              	.L65:
 1088 044c 00000000 		.word	ball
 1089              		.cfi_endproc
 1090              	.LFE13:
 1092              	.Letext0:
 1093              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1094              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 1095              		.file 4 "C:/Users/johan/google_drive/Programmering/Git/Orm/defines.h"
