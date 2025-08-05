[org 0x0100]
jmp start
multiplicand: DD 0x30DA5   ;200101 = 0b 11001000
multiplier: db 0xC4 ;196 = 0b 11000100
result: DD 00    ;should be 10,000 = 0x2710

start:

mov cl, 8 ; number of digits of multiplier/size of multiplier
mov dl, [multiplier]
checkbit: 
    shr dl, 1
    jnc skip
        mov al, [multiplicand]      ;extended addition
        add byte [result], al
        mov al, [multiplicand+1]
        add byte [result+1], al
        mov al, [multiplicand+2]
        add byte [result+2], al
        mov al, [multiplicand+3]
        adc byte [result+3], al
    skip:
    shl byte [multiplicand], 1  ;extended shift
    rcl byte [multiplicand+1], 1
    rcl byte [multiplicand+2], 1
    rcl byte [multiplicand+3], 1
    dec cl
    jnz checkbit
    mov ax, 0x4c00
    int 0x21
    