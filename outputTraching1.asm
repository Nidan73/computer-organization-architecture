.MODEL SMALL
.STACK 100H
.DATA
A DB ?
B DB ?
CR EQU 0DH
LF EQU 0AH
.CODE 

MN PROC
MOV DL,CR
MOV AH,2H
INT 21H
MOV DL,LF
INT 21H
RET  
MN ENDP 

MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV BL,'5'
MOV CX,4 

TOP:
MOV AH,2H
MOV DL,BL ; bl=5, dl=5  2nd: bl=6 , dl=6
INT 21H ; 5 ,6
INC BL  ; bl=6
MOV dl , bl
INT 21H ; 5 ,6
CALL MN ; new line print 
LOOP TOP

MOV AL,'0'
ADD AL,7 ; al=7
MOV AH,2H
MOV DL,AL
INT 21H   ; 7
CALL MN ; new
MOV A,'A' ; 41+3=44 D
ADD A,3
MOV B,'9'
SUB B,5    ;4
MOV AH,2H
MOV DL,A
INT 21H ;D D
INT 21H
CALL MN ; new 
MOV AH,2H
MOV DL,B
INT 21H ; 4
CALL MN
MOV DL,'Z'
INT 21H ;Z
OR DL,32H   ;  5A = 0101 1010
           ;  32 = 0011 0010 =0111 1010 7A = z
MOV AH,2H
INT 21H ; z
AND DL,0DFH ; Z
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP    ; 55 new 66 new 77 new 88 new 7 new DD new 4 new ZzZ

END MAIN