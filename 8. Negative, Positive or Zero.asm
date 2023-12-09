.MODEL SMALL
.STACK 100H
.DATA

msg1 DB 'POSSITIVES$'
msg2 DB 'NEGATIVES$'
msg3 DB 'ZEROS$'

.CODE
MAIN PROC FAR
    MOV AX, @data
    MOV DS,AX
    
    MOV AH, 1
    INT 21H
    
    CMP AL,30H
    JG LABEL1
    JL LABEL2
    JE LABEL3
    
LABEL1:
    MOV AH,9
    LEA DX, MSG1
    INT 21H
    JMP EXIT
    
LABEL2:
    MOV AH,9
    LEA DX, MSG2
    INT 21H
    JMP EXIT
    
LABEL3:
    MOV AH, 9
    LEA DX, MSG3
    INT 21H
    
EXIT:    ; Terminate the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
