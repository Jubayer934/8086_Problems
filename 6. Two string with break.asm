.model small
.stack 100h 
.data
.code
message1 DB "This is the first message!$"
message2 DB "And here is the second message!$"
MAIN PROC
    ; Print the first message
    MOV AX, @data
    MOV DS, AX
    MOV AH, 09h
    LEA DX, message1  
 
    INT 21H

    ; Create a line break (Carriage Return and Line Feed)
    MOV AH, 02h
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Print the second message
    MOV AH, 09h
    LEA DX, message2
    INT 21H

    ; Create another line break
    MOV AH, 02h
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Program exit
    MOV AH, 4CH
    INT 21H



MAIN ENDP
END MAIN
