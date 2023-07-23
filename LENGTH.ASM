DATA SEGMENT
        MSG1 DB 10,13,"ENTER A STRING : $"
        MSG2 DB 10,13,"LENGTH = $"
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        LEA DX,MSG1
        MOV AH,09H
        INT 21H
        MOV CL,0H
        READ :
                MOV AH,01H
                INT 21H
                CMP AL,13
                JZ EXIT
                INC CL
                JMP READ
        EXIT :
                LEA DX,MSG2
                MOV AH,09H
                INT 21H
                MOV AL,CL
                ADD AL,30H
                MOV DL,AL
                MOV AH,02H
                INT 21H
                MOV AH,4CH
                INT 21H
CODE ENDS
END START

