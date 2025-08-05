;db define byte
;dw define word
;dd define double
;dq define quad 




[org 0x100]
jmp start
num1: dw 0x40FF
dest1: dw 0x0
dest2: dw 0x40FF
start:

; shift left when a single register is capable to hold number

mov ax, [num1]
shl ax, 1
mov [dest1], ax

; shift when a single register can not hold our number

shl byte[dest2], 1   ;first 8 bits
rcl byte[dest2+1], 1 ;next 8 bits