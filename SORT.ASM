DATA SEGMENT
    ARR DB 1H, 5H, 2H, 9H, 4H, 8H, 6H, 3H
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA

START:
    MOV AX,DATA
    MOV DS,AX

    MOV CH,07H
UP2:
    MOV CL,07H
    LEA SI,ARR
UP1:
    MOV AL,[SI]
    MOV BL,[SI+1]
    CMP AL,BL
    JC DOWN
    MOV DL,[SI+1]
    XCHG DL,[SI]
    MOV [SI+1],DL
DOWN:
    INC SI
    DEC CL
    JNZ UP1
    DEC CH
    JNZ UP2

    LEA SI,ARR
    MOV CL,08
PRINTF:
    MOV DL," "
    MOV AH,02H
    INT 21H
    MOV AX,[SI]
    ADD AX,30H
    MOV DX,AX
    MOV AH,02H
    INT 21H
    INC SI
    DEC CL
    JNZ PRINTF

    MOV AH,4CH
    INT 21H

CODE ENDS
END START
