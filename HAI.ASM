data segment
        msg db"hello world $"
data ends
code segment
        assume ds:data,cs:code
start:
        mov ax,data
        mov ds,ax
        mov dx,offset msg
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
