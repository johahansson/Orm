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
  11              		.file	"delays.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	delay_250ns
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	delay_250ns:
  23              	.LFB0:
  24              		.file 1 "C:/Users/johan/google_drive/Programmering/Git/Orm/delays.c"
   1:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** #include "delays.h"
   2:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** #include "defines.h"
   3:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 
   4:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** void delay_250ns(void) {
  25              		.loc 1 4 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 00AF     		add	r7, sp, #0
  34              		.cfi_def_cfa_register 7
   5:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	*STK_CTRL = 0;				// clear SysTik
  35              		.loc 1 5 0
  36 0004 0C4B     		ldr	r3, .L3
  37 0006 0022     		movs	r2, #0
  38 0008 1A60     		str	r2, [r3]
   6:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	*STK_LOAD = 41;				// initialize with 42 cycles
  39              		.loc 1 6 0
  40 000a 0C4B     		ldr	r3, .L3+4
  41 000c 2922     		movs	r2, #41
  42 000e 1A60     		str	r2, [r3]
   7:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	*STK_VAL = 0;				// clear countregister
  43              		.loc 1 7 0
  44 0010 0B4B     		ldr	r3, .L3+8
  45 0012 0022     		movs	r2, #0
  46 0014 1A60     		str	r2, [r3]
   8:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	*STK_CTRL = 5;				// reset counter
  47              		.loc 1 8 0
  48 0016 084B     		ldr	r3, .L3
  49 0018 0522     		movs	r2, #5
  50 001a 1A60     		str	r2, [r3]
   9:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	while ((*STK_CTRL & 0x00010000) == 0) {}	// wait until COUNTFLAG = 1
  51              		.loc 1 9 0
  52 001c C046     		nop
  53              	.L2:
  54              		.loc 1 9 0 is_stmt 0 discriminator 1
  55 001e 064B     		ldr	r3, .L3
  56 0020 1A68     		ldr	r2, [r3]
  57 0022 8023     		movs	r3, #128
  58 0024 5B02     		lsls	r3, r3, #9
  59 0026 1340     		ands	r3, r2
  60 0028 F9D0     		beq	.L2
  10:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	*STK_CTRL = 0;				// clear SysTik
  61              		.loc 1 10 0 is_stmt 1
  62 002a 034B     		ldr	r3, .L3
  63 002c 0022     		movs	r2, #0
  64 002e 1A60     		str	r2, [r3]
  11:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** }
  65              		.loc 1 11 0
  66 0030 C046     		nop
  67 0032 BD46     		mov	sp, r7
  68              		@ sp needed
  69 0034 80BD     		pop	{r7, pc}
  70              	.L4:
  71 0036 C046     		.align	2
  72              	.L3:
  73 0038 10E000E0 		.word	-536813552
  74 003c 14E000E0 		.word	-536813548
  75 0040 18E000E0 		.word	-536813544
  76              		.cfi_endproc
  77              	.LFE0:
  79              		.align	1
  80              		.global	delay_500ns
  81              		.syntax unified
  82              		.code	16
  83              		.thumb_func
  84              		.fpu softvfp
  86              	delay_500ns:
  87              	.LFB1:
  12:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 
  13:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** void delay_500ns(void) {
  88              		.loc 1 13 0
  89              		.cfi_startproc
  90              		@ args = 0, pretend = 0, frame = 0
  91              		@ frame_needed = 1, uses_anonymous_args = 0
  92 0044 80B5     		push	{r7, lr}
  93              		.cfi_def_cfa_offset 8
  94              		.cfi_offset 7, -8
  95              		.cfi_offset 14, -4
  96 0046 00AF     		add	r7, sp, #0
  97              		.cfi_def_cfa_register 7
  14:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	delay_250ns();
  98              		.loc 1 14 0
  99 0048 FFF7FEFF 		bl	delay_250ns
  15:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	delay_250ns();
 100              		.loc 1 15 0
 101 004c FFF7FEFF 		bl	delay_250ns
  16:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** }
 102              		.loc 1 16 0
 103 0050 C046     		nop
 104 0052 BD46     		mov	sp, r7
 105              		@ sp needed
 106 0054 80BD     		pop	{r7, pc}
 107              		.cfi_endproc
 108              	.LFE1:
 110              		.align	1
 111              		.global	delay_micro
 112              		.syntax unified
 113              		.code	16
 114              		.thumb_func
 115              		.fpu softvfp
 117              	delay_micro:
 118              	.LFB2:
  17:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 
  18:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** void delay_micro(unsigned int us) {
 119              		.loc 1 18 0
 120              		.cfi_startproc
 121              		@ args = 0, pretend = 0, frame = 8
 122              		@ frame_needed = 1, uses_anonymous_args = 0
 123 0056 80B5     		push	{r7, lr}
 124              		.cfi_def_cfa_offset 8
 125              		.cfi_offset 7, -8
 126              		.cfi_offset 14, -4
 127 0058 82B0     		sub	sp, sp, #8
 128              		.cfi_def_cfa_offset 16
 129 005a 00AF     		add	r7, sp, #0
 130              		.cfi_def_cfa_register 7
 131 005c 7860     		str	r0, [r7, #4]
  19:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	while(us--) {
 132              		.loc 1 19 0
 133 005e 07E0     		b	.L7
 134              	.L8:
  20:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 		delay_250ns();
 135              		.loc 1 20 0
 136 0060 FFF7FEFF 		bl	delay_250ns
  21:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 		delay_250ns();
 137              		.loc 1 21 0
 138 0064 FFF7FEFF 		bl	delay_250ns
  22:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 		delay_250ns();
 139              		.loc 1 22 0
 140 0068 FFF7FEFF 		bl	delay_250ns
  23:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 		delay_250ns();
 141              		.loc 1 23 0
 142 006c FFF7FEFF 		bl	delay_250ns
 143              	.L7:
  19:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 		delay_250ns();
 144              		.loc 1 19 0
 145 0070 7B68     		ldr	r3, [r7, #4]
 146 0072 5A1E     		subs	r2, r3, #1
 147 0074 7A60     		str	r2, [r7, #4]
 148 0076 002B     		cmp	r3, #0
 149 0078 F2D1     		bne	.L8
  24:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 	} 
  25:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** }
 150              		.loc 1 25 0
 151 007a C046     		nop
 152 007c BD46     		mov	sp, r7
 153 007e 02B0     		add	sp, sp, #8
 154              		@ sp needed
 155 0080 80BD     		pop	{r7, pc}
 156              		.cfi_endproc
 157              	.LFE2:
 159              		.align	1
 160              		.global	delay_milli
 161              		.syntax unified
 162              		.code	16
 163              		.thumb_func
 164              		.fpu softvfp
 166              	delay_milli:
 167              	.LFB3:
  26:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 
  27:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** void delay_milli(unsigned int ms) {
 168              		.loc 1 27 0
 169              		.cfi_startproc
 170              		@ args = 0, pretend = 0, frame = 8
 171              		@ frame_needed = 1, uses_anonymous_args = 0
 172 0082 80B5     		push	{r7, lr}
 173              		.cfi_def_cfa_offset 8
 174              		.cfi_offset 7, -8
 175              		.cfi_offset 14, -4
 176 0084 82B0     		sub	sp, sp, #8
 177              		.cfi_def_cfa_offset 16
 178 0086 00AF     		add	r7, sp, #0
 179              		.cfi_def_cfa_register 7
 180 0088 7860     		str	r0, [r7, #4]
  28:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** //	#ifdef SIMULATOR
  29:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 		while( ms-- )
 181              		.loc 1 29 0
 182 008a 02E0     		b	.L10
 183              	.L11:
  30:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 			delay_micro(1);
 184              		.loc 1 30 0
 185 008c 0120     		movs	r0, #1
 186 008e FFF7FEFF 		bl	delay_micro
 187              	.L10:
  29:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** 			delay_micro(1);
 188              		.loc 1 29 0
 189 0092 7B68     		ldr	r3, [r7, #4]
 190 0094 5A1E     		subs	r2, r3, #1
 191 0096 7A60     		str	r2, [r7, #4]
 192 0098 002B     		cmp	r3, #0
 193 009a F7D1     		bne	.L11
  31:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** //	#else
  32:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** //		while( ms-- )
  33:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** //			delay_micro(1000);
  34:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** //	#endif
  35:C:/Users/johan/google_drive/Programmering/Git/Orm\delays.c **** }
 194              		.loc 1 35 0
 195 009c C046     		nop
 196 009e BD46     		mov	sp, r7
 197 00a0 02B0     		add	sp, sp, #8
 198              		@ sp needed
 199 00a2 80BD     		pop	{r7, pc}
 200              		.cfi_endproc
 201              	.LFE3:
 203              	.Letext0:
