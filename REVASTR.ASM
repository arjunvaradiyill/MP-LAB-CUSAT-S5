data segment
        msg1 db 10,13,"Enter a string : $"
        msg2 db 10,13,"string is :$"
data ends
code segment
        assume cs:code,ds:data
start :
        mov ax,data
        mov ds,ax
        mov di,4000h
        mov cl,00h
        lea dx,msg1
        mov ah,09h
        int 21h
        inputstr:
                mov ah,01h
                int 21h
                mov [di],al
                inc di
                inc cl
                cmp al,0dh
                jnz inputstr
                sub di,02h
                mov dx,0000h
                mov dx,offset msg2
                mov ah,09h
                int 21h
            rev:
                mov dl,[di]
                mov ah,02h
                int 21h
                dec di
                dec cl
                cmp cl,0h
                jne rev
       exit :
                mov ah,4ch
                int 21h
code ends
end start
