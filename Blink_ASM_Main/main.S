/** 
 *  This file contains the main() function.
 *
 *  In this example, we are creating a main() function rather than using the setup() and loop() functions.
 *  Since we intend to use the Arduino libraries, we call the init() function to ensure that the timers
 *  and other functionality is initialize correctly for the Ardido library to work properly.
 */
#include <avr/io.h>

.extern   init
.extern   delay

.section .text

.global main

main:
    call    init
    
    ldi     r16,0xff
    sbi     _SFR_IO_ADDR(DDRB), PIN5

.mainloop:
    ldi     r22, 0xe8 ; 1 second (1000 millis)
    ldi     r23, 0x03
    ldi     r24, 0x00 ; 0
    ldi     r25, 0x00 ; 0
    call    delay

    com     r16
    breq    .ledoff
    sbi     _SFR_IO_ADDR(PORTB), PIN5
    rjmp    .leddone

.ledoff:
    cbi     _SFR_IO_ADDR(PORTB), PIN5

.leddone:
    rjmp    .mainloop         ; loop forever
