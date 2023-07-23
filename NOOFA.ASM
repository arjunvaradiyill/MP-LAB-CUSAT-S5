data segment
        word1 db"aadaada$"
        let db "a"
data ends
code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea si,word1
        lea di,let
        mov bh,0h
        mov cl,7
        apple:
                mov al,[si]
                mov bl,[di]
                cmp al,bl
                jne next
                inc bh
        next:
                inc si
                loop apple
                add bh,30h
                mov dl,bh
                mov ah,02h
                int 21h
                mov ah,4ch
                int 21h
code ends
end  start
