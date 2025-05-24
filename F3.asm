
.MODEL SMALL
.STACK 100H
.DATA
    msg1    DB  'Enter a number:', '$'
    msg2    DB  'The number is even.', '$'
    msg3    DB  'The number is odd..', '$'
    input   DB  ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ; Display message asking for input
    MOV AH, 09H
    LEA DX, msg1
    INT 21H                  ; Read input character
    MOV AH, 01H
    INT 21H
    MOV BL, AL               ; Check if input character is a number
    MOV AH, 00H
    MOV AL, BL
    AND AL, 0FH              ; only keep the lower 4 bits
    CMP AL, 9
    JA  not_number
    ; Check if the number is odd or even
    TEST BL, 01H
    JZ even_number ; jump if the number is even    
    ; Display message for odd number
    MOV AH, 09H
    LEA DX, msg3
    INT 21H
    JMP exit_program    
  even_number:
  ; Display message for even number
    MOV AH, 09H
    LEA DX, msg2
    INT 21H
    JMP exit_program    
  not_number:
    ; Display error message for non-numeric input
    MOV AH, 09H
    LEA DX, msg1
    INT 21H    
  exit_program:
    MOV AH, 4CH
    INT 21H
  MAIN ENDP
END MAIN

