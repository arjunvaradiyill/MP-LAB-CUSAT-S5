data segment
        msg1 db "Enter count: ",'$'
        msg2 db 10,13, "Sum is: ",'$'
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
        mov cl,al
        mov ax,00h
        mov bx,01h
count:
        add ax,bx
        inc bx
        dec cl
        jnz count
        aam
        add ax,3030h
        push ax
        display msg2
        pop ax
        mov dh,al
        mov dl,ah
        mov ah,02h
        int 21h
        mov dl,dh
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start