[org 0x100]

jmp start ;0103
num1:dw 0x40FF ;16639 ; 100000011111111
dest:dw 0x40FF 
src: dw 0x1001 ;4097 ; 1000000000001
start:

; shift left when a single register is capable to hold numnber

mov ax, [num1]
shl ax, 1

; shift when a single register can not hold our number

mov [dest], ax
shl byte[dest], 1 ;first 8 bits
rcl byte [dest+1], 1 ;next 8 bits
mov ax, 0x4c00
int 0x21