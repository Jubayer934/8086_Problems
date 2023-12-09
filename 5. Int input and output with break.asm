.model small
.stack 100h
.code

MAIN PROC
    MOV AH,1    ;User Input
    INT 21H
    MOV BL,AL
    
    
    MOV AH,2     ; 4 line for create break
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    
    MOV Ah,2     ;output of the user input
    MOV DL,BL
    INT 21H
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN