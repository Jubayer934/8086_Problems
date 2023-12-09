.model small
.stack 100h
.code

MAIN PROC
    MOV AH,1    ;first User Input
    INT 21H
    MOV BL,AL 
    
    int 21h     ; second user input
    mov bh,al
    
    
    MOV AH,2     ; 4 line for create break
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    
    MOV Ah,2     ;output of first the user input
    MOV DL,Bl
    INT 21H
    
    MOV AH,2     ; 4 line for create break
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    MOV Ah,2     ;output of second the user input
    MOV DL,Bh
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN