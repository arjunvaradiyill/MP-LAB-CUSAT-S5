DATA SEGMENT
        ARR DB 2,1,3,7,5
        LAR DB ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV CL,5H
        MOV BL,0H
        LEA SI,ARR
        L1:
                MOV AL,[SI]
                CMP AL,BL
                JL L2
                MOV BL,AL
         L2:
                INC SI
                DEC CL
                JNZ L1
                MOV LAR,BL
                MOV DL,LAR
                ADD DL,48
                MOV AH,02H
                INT 21H
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
