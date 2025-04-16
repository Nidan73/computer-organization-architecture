.model small 
.stack 100h 
.data 

m0 dw 'i know magic.$' 
m1 dw 'magician found $'
m2 dw 'No.$'
m3 dw 'do you know magic ?$'

.code 
main proc 
    mov ax , @data 
    mov ds , ax 
    mov ax ,5h
    mov bx ,2h
    cmp ax, bx
    mov ah , 9 
    lea dx , m3
    int 21h
    
    mov ah ,2 
    mov dl , 10
    int 21h 
    
   
    mov dl,13 
    int 21h
    jge al
    
    al : 
    mov ah,9
    lea dx , m2
    int 21h 
    JMP EXIT 
              

    mov ah,9
    lea dx , m1
    int 21h    
    
    exit: 
    
    mov ah,2
    mov dl ,10 
    int 21h 
    mov dl,13
    int 21h 
    mov ah ,9
    lea dx, m0
    int 21h 
    
    mov ah ,4ch
    int 21h
    main endp 
    end main 