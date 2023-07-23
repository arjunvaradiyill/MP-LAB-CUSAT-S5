data segment
        words db"adith is ok.$"
data ends
code segment
        assume  cs:code,ds:data
start :
        mov ax,data
        mov ds,ax
        mov bh,01h
        lea si,words

        apple:
                mov ah,[si]
                cmp ah,"."
                je exit
                cmp ah,20h
                jne next
                inc bh
         next:
                inc si
                loop apple
         exit :
                mov al,bh
                add al,30h
                mov dl,al
                mov ah,02h
                int 21h
                mov ah, 4ch
                int 21h
code ends
end start

