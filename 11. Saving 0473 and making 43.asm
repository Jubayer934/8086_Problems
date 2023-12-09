.model small
.stack 100h
.code

MOV BX, 0473h   ; Initialize BX with 0473H

; Use SHR to clear Higer 4 bits in BH
SHL BH, 4

; Use SHL to shift the value in BL 4 bits to the left
SHL BL, 4
; Use SHL to shift the value in BL 4 bits to the Right
SHR BL,4



; Use OR to combine BH with BL
OR BL, BH 
    
    ;printing the value after OR
MOV DX,BX
MOV AH,02H
INT 21H

INT 20h         ; Terminate the program

RET
