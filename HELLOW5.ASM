data segment
        msg db 10,13,"hello world$"
data ends
code segment
        assume cs:code,ds:data
start :
        mov ax,data
        mov ds,ax
        mov cx,5
        five :
                mov dx,offset msg
                mov ah,09h
                int 21h
                dec cx
                cmp cx,0
                jne five
                mov ah,4ch
                int 21h
code ends
end start


