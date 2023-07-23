data segment
        msg db "daaa$"
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov cl,5
        laap:
                mov dx,offset msg
                mov ah,09h
                int 21h
                mov dl,10
                mov ah,02h
                int 21
                mov dl,13
                mov ah,02h
                int 21h
                dec cl
                cmp cl,0
                jne laap
        mov ah,4ch
        int 21h
code ends
end start


