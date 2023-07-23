data segment
        a db 10,13,"enter the string : $"
        b db 10,13,"string is palindrome.$"
        c db 10,13,"string is not palindrome.$"
        arr db 30h dup(?)
data ends
code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea si,arr
        lea dx,a
        mov ah,09h
        int 21h
        mov cl,00h
        read :
                mov ah,01h
                int 21h
                cmp al,0dh
                jz stop
                mov [si],al
                inc si
                inc cl
                jmp read
        stop:
                lea di,arr
                dec si
        check:
                mov al,[si]
                mov ah,[di]
                cmp al,ah
                jnz notpal
                dec si
                inc di
                loop check
                lea dx,b
                mov ah,09h
                int 21h
                jmp exit
        notpal:
                lea dx,c
                mov ah,09h
                int 21h
                
        exit:
                mov ah,4ch
                int 21h
code ends
end start

