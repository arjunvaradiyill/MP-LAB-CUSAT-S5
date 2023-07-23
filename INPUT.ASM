data segment
        msg1 db "enter a letter : $"
        msg2 db 10,13,"entered letter is : $"
data ends
code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov dx,offset msg1
        mov ah,09h
        int 21h
        mov ah,01h
        int 21h
        mov dx,offset msg2
        mov ah,09h
        int 21h
        mov dl,al
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
