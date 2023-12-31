/**
 * 16 bit random number generator, Linear-feedback shift register
 *
	static unsigned int lfsr = 0xACE1;
	static unsigned int bit;

	uint16_t _fx_rand()
	{
	    bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
	    return lfsr = (lfsr >> 1) | (bit << 15);
	}
 */
#include <avr/io.h>

.section .text

.global init_rnd

.equ RANDOMSEED, 0xACE1

/*
 * initialize random number generator
 */
init_rnd:
	  push r16

	  ldi	r16, 0x00
	  sts bit,r16
	  sts bit+1,r16

	  ldi	r16, lo8(RANDOMSEED)
	  sts lfsr,r16
	  ldi	r16, hi8(RANDOMSEED)
	  sts lfsr+1,r16

	  pop r16
	  ret

.global rnd

/*
 * Return the next 16 bit psuedo random number
 * r24 - low byte
 * r25 - high byte
 */
rnd:
	  push r16
	  push r17

	  lds	r16, lfsr		; (lfsr >> 0)
	  lds	r17, lfsr+1

	  lds	r24, lfsr		; (lfsr >> 2)
	  lds	r25, lfsr+1
	  lsr	r25
	  ror	r24
	  lsr	r25
	  ror	r24

	  eor	r16, r24		; ^ XOR
	  eor	r17, r25

	  lds	r24, lfsr		; (lfsr >> 3)
	  lds	r25, lfsr+1
	  lsr	r25
	  ror	r24
	  lsr	r25
	  ror	r24
	  lsr	r25
	  ror	r24

	  eor	r16, r24		; ^ XOR
	  eor	r17, r25

	  lds	r24, lfsr		; (lfsr >> 5)
	  lds	r25, lfsr+1
	  lsr	r25
	  ror	r24
	  lsr	r25
	  ror	r24
	  lsr	r25
	  ror	r24
	  lsr	r25
	  ror	r24
	  lsr	r25
	  ror	r24

	  eor	r16, r24		; ^ XOR
	  eor	r17, r25

	  andi	r16, 0x01	; & 0x0001
	  andi	r17, 0x00
	  sts		bit, r16
	  sts		bit+1, r17

	  lds	r24, lfsr		; (lfsr >> 1)
	  lds	r25, lfsr+1
	  lsr	r25
	  ror	r24

	  lds	r16, bit
    sbrc	r16, 0		; skip if bit 0 is clear
	  ori	r25, 0x80   ; set the high bit of r25

	  sts	lfsr, r24
	  sts	lfsr+1, r25

	  pop	r17
	  pop	r16
	  ret

.section .data

lfsr:	.space 2
bit:	.space 2
