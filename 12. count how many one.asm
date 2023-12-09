.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC FAR
    MOV BH, 85H    ; Initialize BH with 85H (binary 10000101)
    XOR AX, AX     ; Clear CX to use it as a counter for set bits
    MOV CL, 8      ; Set DL to 8, the number of bits to check (8 bits in BH)

count_bits_loop:
    ROL BH, 1      ; Rotate BH to the left by 1 bit
    JC increment_counter ; If the carry flag (CF) is set, increment the counter
    
    JMP decrement
increment_counter:
    INC AX         ; Increment the counter for each set bit
  

    
 
decrement:
    DEC CL         ; Decrement DL to keep track of the number of remaining bits
    JNZ count_bits_loop ; If DL is not zero, continue the loop



        ; Function to print a characte
    MOV DX, AX 
    MOV AH, 02H
    ADD DX, 48 
    INT 21H

    ; Terminate the program
    MOV AH, 4CH
    INT 21H



MAIN ENDP
END MAIN
