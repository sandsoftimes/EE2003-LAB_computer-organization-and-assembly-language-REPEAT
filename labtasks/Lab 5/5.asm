[org 0x0100]

jmp start

data: dw 2, 0, 0, 1, 0, 1

start: 

    mov cx, 6

    outerloop:

        mov bx, 0

            innerloop:

                mov ax, [data + bx]

                cmp ax, 2

                je noswap

                cmp ax, [data + bx + 2]

                jbe noswap                  ;if we don't have to swap, we just

                                ; think of this as the "if"

                    ; the swap potion

                    mov dx, [data + bx + 2]

                    mov [data + bx + 2], ax ; again with the AX?

                    mov [data + bx], dx

                noswap:

                add bx, 2

                cmp bx, 10

                jne innerloop

                ; check outer loop termination

                sub cx, 1

                jnz outerloop

                ;exit system call

                mov ax, 0x4c00

                int 0x21