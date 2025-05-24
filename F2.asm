.model small 
.stack 100h
.data 

msg1 db  'enter 3 characters : $'
msg2 db 0dh,0ah,'Reversed 3 characters are : $'
.code 

main proc 
    
    mov ax, @data ; initialize data segment 
    mov ds , ax 
    lea dx , msg1 ; display msg1 
    mov ah , 09h
    int 21h
    mov cx , 3 ; counter for 3 characters 
            
    read_character :
    
    mov ah,1  ;read character 
    int 21h  
    push ax ; push character into stack 
    loop read_character
    lea dx , msg2 ; display msg2 
    mov ah,09
    int 21h
    mov cx,3 ; count for reversed order 
    
    Display_character :
    
    pop ax; pop the char from the stack
    mov dl , al; mov char to dl for display
    mov ah , 2h ; display the char
    int 21h
    loop Display_character 
    
    mov ah ,4ch
    int 21h 
    
    main endp
end main
    