data segment
        msg1 db "Enter count: ",'$'
        msg2 db 10,13, "Series is : ",'$'
data ends
display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
        endm
code segment
        assume ds:data,cs:code
start:
        mov ax,data
        mov ds,ax
        display msg1
        mov ah,01h
        int 21h
        sub al,30h
        mov ch,al
        display msg2
        mov bh,01h
        mov bl,00h
        mov cl,00h
L1:
        cmp ch,00h
        jz done
        mov dl," "
        mov ah,02h
        int 21h
        aam
        mov dl,cl
        add dl,30h
        mov ah,02h
        int 21h
        add bh,bl
        mov cl,bh
        mov bh,bl
        mov bl,cl
        dec ch
        jnz L1
done:
        mov ah,4ch
        int 21h
code ends
end start
