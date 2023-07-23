//no of words
data segment
        words db "ni oru killadi enne monu.$"
data ends
code segment
        assume cs: code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea si,words
        mov bh,01h
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
        exit:
                mov al,bh
                add al,30h
                mov dl,al
                mov ah,02h
                int 21h
                mov ah,4ch
                int 21h
code ends
end start



