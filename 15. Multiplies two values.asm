.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC FAR 
    
    MOV AX, 00AEh
    MOV BL, 10h
    
    MUL BL
    MOV BX,AX


    MOV CX, 4        

print_hex_loop:
    MOV AH, 02H  

   
    MOV DL, BH       ; Move the high byte of BX to DL
    SHR DL, 4        ; Shift right by 4 bits to get the high nibble
    
    ; Convert to ASCII an
    ADD DL, 48      ; Convert to ASCII
    CMP DL, 57      ; Check if the digit is greater than 9
    JBE print_digit  ; Jump to printing if it's less than or equal to 9

    ; convert to A-F
    ADD DL, 7        ; Adjust A-F

print_digit:
    INT 21H          ; Print the character

    ; Shift BX to the left by 4 bits
    SHL BX, 4

    ; Decrement CX
    DEC CX
    JNZ print_hex_loop ; If CX is not zero

    ; Terminate the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
