/** 
 *  This file contains the setup() and loop() functions.
 *  this is a simple example to show how to read from a potentiometer connected to analog zero
 *  and to use the result to set a PWM channel connected to a servo. Turning the potentiometer
 *  will cause the servo to move.
 */
 #include <avr/io.h>
 
.extern   delay

.section .text

.global setup
.global loop

/**
 * setup function
 */
setup:
    call    init_adc
    call    init_pwm11
    ret

/**
 * loop function
 */
loop:
    ldi     r22, 0x0F ; (15 millis)
    ldi     r23, 0x00
    ldi     r24, 0x00 ; 0
    ldi     r25, 0x00 ; 0
    call    delay

    ldi     r24, 0x00
    call    read_adc

    ; shift r25/r24 to the right 2 times
    lsr     r25
    ror     r24
    lsr     r25
    ror     r24

    call    set_pwm11

    ret
