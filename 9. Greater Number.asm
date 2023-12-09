.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC FAR
    MOV AL,48
    MOV BL,55
    
    
    CMP AL,BL
    JL BIGGER
    MOV AH,2
    MOV DL,AL
    INT 21H
               
    JMP EXIT
    
BIGGER:
    MOV AH,2
    MOV DL,BL
    INT 21H
EXIT:    ; Terminate the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
