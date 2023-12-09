.MODEL SMALL
.STACK 100H
.DATA
     AHMsg DB 'REMINDER: $', 0 
     ALMsg DB 'DIVISOR : $',  0
.CODE
MAIN PROC FAR
    MOV AX, 03A0h    ; Move the value 10h into AL
    MOV BX, 10h  ; Move the value 93A0h into BX

    DIV BX
    
    MOV BX,AX 

    MOV CX, 4 
    MOV AX,@DATA
    MOV DS,AX
    ; Print AH message
    MOV AH, 09H
    LEA DX, AHMsg
    INT 21H        

print_hex_loop:
    CMP CX,2
    JE brack 

again:   
    MOV DL, BH       ; Move the high byte of BX to DL
    SHR DL, 4        ; Shift right by 4 bits to get the high nibble
    
    MOV AH, 02H
     ; Convert to ASCII an
    ADD DL, '0'      ; Convert to ASCII
    CMP DL, '9'      ; Check if the digit is greater than 9
    JBE print_digit  ; Jump to printing if it's less than or equal to 9

    ; convert to A-F
    ADD DL, 7        ; Adjust A-F

print_digit:
    INT 21H          ; Print the character

    ; Shift BX to the left by 4 bits
    SHL BX, 4

    ; Decrement CX
    DEC CX
    JNZ print_hex_loop
    jmp EXIT ; If CX is not zero 
brack:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; Print AH message
    MOV AH, 09H
    LEA DX, ALMsg
    INT 21H
    jmp again
    ; Terminate the program
EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN