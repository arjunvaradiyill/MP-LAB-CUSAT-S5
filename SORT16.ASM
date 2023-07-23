DATA SEGMENT
    ARR DW 1, 5, 2, 9, 4, 8, 6, 3
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA

START:
    MOV AX,DATA
    MOV DS,AX

    MOV CX,7
UP2:
    MOV DX,CX
    LEA SI,ARR
    XOR CX,CX
UP1:
    MOV BX,[SI]
    CMP BX,[SI+2]
    JBE DOWN
    MOV DX,[SI+2]
    XCHG BX,[SI]
    MOV [SI+2],BX
DOWN:
    ADD SI,2
    INC CX
    CMP CX,DX
    JB UP1
    LOOP UP2

    LEA SI,ARR
    MOV CX,8
PRINTF:
    MOV DL," "
    MOV AH,02H
    INT 21H
    MOV BX,[SI]
    ADD BX,3030H
    MOV DX,BX
    SHR BX,8
    MOV AH,02H
    INT 21H
    MOV DL,BL
    MOV AH,02H
    INT 21H
    INC SI,2
    DEC CX
    JNZ PRINTF

    MOV AH,4CH
    INT 21H

CODE ENDS
END START