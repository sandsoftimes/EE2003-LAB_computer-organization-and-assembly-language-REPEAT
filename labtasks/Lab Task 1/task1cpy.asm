[org 0x0100]

mov ax, 0

mov bx, 0

mov cx, 6

Hoop:

    mov dx, [num1 + bx]

    cmp dx, 1

    je J1

    add ax, [num1 + bx]

J1:

    add bx, 2

    cmp bx, 12

    jne Hoop

    mov [result], ax

mov ax, 0x4c00

int 0x21

num1: dw 2, 0, 5, 1, 1, 1

result: dw 0
