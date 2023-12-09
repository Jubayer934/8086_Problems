.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC FAR
    MOV BH, 85H     ; Initialize BH with 85H (binary 10000101)
    MOV CX, 8       ; Set CX to 8, the number of bits to check (8 bits in BH)

print_binary_loop:
    ROL BH, 1       ; Rotate BH to the left by 1 bit
    JC print_One
    JNC print_zero    ; If the carry flag (CF) is set, print '1'
    JMP next_bit    ; If CF is not set, jump to printing '0'

print_One:
    MOV AH, 02H     ; Set AH for character output
    MOV DL, '1'     ; Move '1' into DL for printing
    INT 21H         ; Print the character
    JMP next_bit    ; Jump to the next bit
    
print_zero:
    MOV AH, 02H      ;to print 
    MOV DL,'0'
    INT 21H

next_bit:
    DEC CX          ; Decrement CX to keep track of the number of remaining bits
    JNZ print_binary_loop ; If CX is not zero, continue the loop

    ; Terminate the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
