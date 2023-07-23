data segment
        msg1 db 10,13,"enter the string : $"
        msg2 db 10,13,"no of vowels : $"
data ends
code segment
        assume cs:code,ds:data

start :
        mov ax,data
        mov ds,ax
        lea dx,msg1
        mov ah,09h
        int 21h
        mov bh,00h
        read :
                mov ah,01h
                int 21h
                cmp al,0dh
                je exit
                cmp al,"a"
                je count
                cmp al,"A"
                je count
                cmp al,"e"
                je count
                cmp al,"E"
                je count
                cmp al,"i"
                je count
                cmp al,"I"
                je count
                cmp al,"o"
                je count
                cmp al,"O"
                je count
                cmp al,"u"
                je count
                cmp al,"U"
                je count
                loop read
        count:
                inc bh
                loop read
        exit:
                lea dx,msg2
                mov ah,09h
                int 21h
                mov al,bh
                add al,30h
                mov dl,al
                mov ah,02h
                int 21h
                mov ah,4ch
                int 21h

code ends
end start

