/**
  * In this example, we we are going to play a tone by calling the Arduino
  * tone library. This example shows how we get around C++ function name mangling.
*/
#include <avr/io.h>
#include "pitches.h"

.extern   init
.extern   delay
.extern   w_tone
.extern   w_noTone

.section .text

.global setup
.global loop

/**
 * setup function
 */
setup:
    ret   

/**
 * loop function
 */
loop:
    ldi     r24, 11
    ldi     r22, lo8(NOTE_C4)
    ldi     r23, hi8(NOTE_C4)
    call    w_tone

    ldi     r22, 0xf4 ; 500
    ldi     r23, 0x01
    ldi     r24, 0x00
    ldi     r25, 0x00
    call    delay

    ldi     r24, 11
    call    w_noTone

    ldi     r24, 11
    ldi     r22, lo8(NOTE_G4)
    ldi     r23, hi8(NOTE_G4)
    call    w_tone

    ldi     r22, 0xf4 ; 500
    ldi     r23, 0x01
    ldi     r24, 0x00
    ldi     r25, 0x00
    call    delay

    ldi     r24, 11
    call    w_noTone

    ret
