data segment
         msg1 db "eNTER A NUMBER : $"
         MSG2 db 10,13, "enterd nuber is odd $"
         msg3 db 10,13, "entered number is even $"
         a db 10 dup(?)
data ends
code segment
        assume cs: code,ds:data
start :
        mov ax,data
        mov ds,ax
        mov dx,offset msg1
        mov ah,09h
        int 21h
        mov si,0
        mov ah,01
        int 21h       
        mov ah,0
        mov dl,2
        div dl
        cmp ah,0
        je even
        mov dx,offset msg2
        mov ah,09h
        int 21h
        jmp exit

even :
        mov dx,offset msg3
        mov ah,09h
        int 21h
        jmp exit
exit : mov ah,4CH
       int 21h
code ends
end start

