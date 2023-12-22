/**
 *  In this example, we are going to be using the serial port. In the setup() function we send
 *  the text "Hello World" to the seal monitor. in the loop function, we monitored the serial input
 *  and when a number 0 to 9 is entered. We convert the ASCII value to a number and use that value 
 *  to program a PWM channel.
 */
.global  delay

.section .text

msg:   .asciz "Hello World \n"    ; include the space before the \n to avoid a compiler error

.global setup
.global loop

/**
 * setup function
 */
setup:
    call    init_serial
    call    init_pwm11

    ldi     zh, hi8(msg)
    ldi     zl, lo8(msg)

.output:
    lpm    r24, z+
    cpi    r24, 0x00
    breq   .exit_setup
    call   tx
    rjmp   .output

.exit_setup:
    ret

/**
 * loop function
 */
loop:
    call    rx_check
    cpi     r24, 0x00
    breq    .exit_loop

    call    rx
    subi    r24, 0x30    ; check for ascii 0x30 - 0x39
    cpi     r24, 0x00
    brlt    .exit_loop

    cpi     r24, 0x0A
    brge    .exit_loop

    ldi     r25, 25
    mul     r25, r24
    
    mov     r24, r0
    call    set_pwm11
        
.exit_loop:
    ret

