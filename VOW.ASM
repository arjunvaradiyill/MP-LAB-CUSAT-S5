data segment
msg db " The Quick brown fox jumped over walls $"
vowel db ?
msg1 db 10,13,"Number of vowels:$"
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov si,offset msg
mov bl,00
back:mov al,[si]
cmp al,'$'
jz final
cmp al,'A'
jz count
cmp al,'E'
jz count
cmp al,'I'
jz count
cmp al,'O'
jz count
cmp al,'U'
jz count
cmp al,'a'
jz count
cmp al,'e'
jz count
cmp al,'i'
jz count
cmp al,'o'
jz count
cmp al,'u'
jz count
inc si
jmp back
count:inc bl
inc si
jmp back
final:mov ah,2h
mov dl,bl
int 21h


mov ah,4ch
int 21h
code ends
end start


