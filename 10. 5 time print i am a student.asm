 .MODEL SMALL
.STACK 100H
.DATA

; The string to be printed
STRING DB 'I am a Student', '$'

.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5  ; Set the loop counter to 5

print_loop:
    ; Load the address of the string
    LEA DX, STRING

    ; Output the string loaded in DX
    MOV AH, 09H
    INT 21H  
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H


    ; Decrement the loop counter
    DEC CX
    
    

    ; Check if CX is zero, if not, jump back to print_loop
    JNZ print_loop

    ; Interrupt to exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
