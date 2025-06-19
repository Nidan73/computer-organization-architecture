.MODEL SMALL
.STACK 100H
.DATA
m1 DB 'First Number: $'
m2 DB 0AH,0DH, 'Second Number: $'
m3 DB 0AH,0DH, 'Third Number: $'
m4 DB 0AH,0DH, 'Fourth Number: $'
m5 DB 0AH,0DH, 'Fifth Number: $'
c1 DB ?
c2 DB ?
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
MOV BH, 'B'  ; BH=B // 42
MOV CX, 8
MOV AH, 9
LEA DX, m1
INT 21H  ; First Number: 01000010

L1:
ROL BH, 1  ; BH=42 = 0100 0010 ; 10000100; CF=0 ; 00001001 CF=1; 00010010 CF=0; 00100100 CF=0; 01001000 CF=0; 10010000 CF=0; 00100001 CF=1; 01000010 CF=0
MOV AH, 2
JNC L2
MOV DL, '1' ; 01000010   ; BH=42//B
INT 21H
LOOP L1
JMP L3 

L2:
MOV DL, '0'
INT 21H
LOOP L1 

L3:
MOV AH, 9
LEA DX, m2
INT 21H ; Second Number:  B
MOV AH, 2
SUB BH, 37H ; 42H-37H = 0BH DECI= 11
CMP BH, 10
JGE L4
MOV DL, BH
ADD DL, 48H
INT 21H 

L4:
MOV DL, BH  ; DL
ADD DL, 37H ; DL=42                                                                       
INT 21H  ; B
MOV AH, 9
LEA DX, m3 
INT 21H  ; Third Number:  3
MOV AH, 2
MOV c1, BH ;CL=0BH
ADD c1, 28H ; 33H; 16BIT
MOV DL, c1 ; DL=3
INT 21H  ;3
MOV AH, 9
LEA DX, m4
INT 21H ; Fourth Number:
MOV AH, 2
MOV c2, BH ; 0BH
ADD c2, 39H ; 
MOV DL, c2
INT 21H  ; D
MOV AH, 9
LEA DX, m5
INT 21H ; Fifth Number: 
MOV AH, 2
MOV DL, BH
ADD DL, 37H
INT 21H ; B
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN