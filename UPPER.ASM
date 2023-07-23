data segment
        var db "orange$"
        no db 6
data ends
code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea si,var
        mov cl,no
        apple:
                mov ah,[si]
                xor ah,20h
                inc si
                mov dl,ah
                mov ah,02h
                int 21h
        loop apple
        mov ah,4ch
        int 21h
code ends
end start
