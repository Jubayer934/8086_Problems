;Jubayer
;ID:2157CSE00934


.model small
.stack 100h
.code

MAIN PROC
    MOV AH,1    ;input FIRST INTEGER
    INT 21h
    MOV BL,AL 
    
    MOV AH,1  ;input SECOND INTEGER
    INT 21h
    MOV CL,AL
    
    SUB BL,CL  ;SUB
    ADD BL,48
    
    MOV AH,2   ;OUTPUT
    MOV DL,BL
    INT 21h     
    
 
    
     
    
    
    EXIT:
    MOV AH,4Ch
    INT 21h
    MAIN ENDP     
END MAIN