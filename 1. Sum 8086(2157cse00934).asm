;Jubayer
;Id: 2157CSE00922


.model small
.stack 100h
.code

MAIN PROC
    MOV AH,1   ;Input first integer
    INT 21h
    MOV BL,AL  
    
    MOV AH,1   ;Input second integer
    INT 21h
    
    ADD AL,BL  ;Sum
    SUB AL,48
    
    MOV AH,2   ;Output
    MOV DL,AL
    INT 21h    
    
     
    
    
    EXIT:
    MOV AH,4Ch
    INT 21h
    MAIN ENDP     
END MAIN