.MODEL SMALL
.STACK 100H
.DATA
msg db 'Hello World$'
.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 09h
    
    int 21h

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN