.MODEL SMALL
.STACK 100H
.DATA

nidan db 'hello world$'
.code 

main proc
;initial ds
mov ax,@data
mov ds,ax
;display message
lea dx,nidan
mov ah,9
int 21h
;return to dos
mov ah,4ch