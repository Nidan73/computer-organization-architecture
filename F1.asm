.model 
.stack 100h 
.data 
msg1 db "type a Character$" 
msg2 db 10,13, "AscII code of $"
msg3 db "In Binary is $"
msg4 db "The number of 1 bit is $"



.code 

mov ax,@data
mov ds,ax
lea dx,msg1
mov ah,9
int 21h

mov ah,1
int 21 

xor bx,bx
mov bl , al 
lea dx , msg2
mov ah,9
int 21h

mov dl,bl
mov ah,2
int 21h

lea dx,msg3
mov ah,9
int 21h 

mov cx,8
mov bh,0

binary :

shl bl,1
jnc zero 
inc bh

mov dl,31h 

jmp display 

zero:

mov dl,30h
display :

mov ah,2
int 21h

ADD bh,30h
lea dx , msg4
mov ah,9
int 21h


