.model small
.stack 100h
.data
    msg1 db 'Input: $'
    matchMsg db 13,10,'Output: Condition matches$'
    noMatchMsg db 13,10,'Output: Does not match the condition$'
.code

main proc
    mov ax, @data
    mov ds, ax

    call ReadBinaryInput    ; Input binary number
    call CheckBitsSet       ; Check required bits

    mov ah, 4ch             ; Exit program
    int 21h
main endp                                                                                                       

; Reads 8-bit binary input and stores in BL
ReadBinaryInput proc
    mov ah, 09h
    lea dx, msg1
    int 21h
    xor bl, bl
    mov cx, 8
ReadLoop:
    mov ah, 01h
    int 21h          ; Read character into AL
    and al, 0Fh      ; Convert ASCII to binary (0 or 1)
    shl bl, 1        ; Shift BL to make room
    or bl, al        ; OR input bit into BL
    loop ReadLoop
    ret
ReadBinaryInput endp

; Checks if bits 1, 3, 6, 8 are set in BL
CheckBitsSet proc
    mov al, bl       ; Copy input to AL
    mov ah, 85h      ; 10000101b = bits 1,3,6,8
    and al, ah       ; Mask AL with 10000101
    cmp al, ah       ; Compare result with mask
    je ShowMatch
    jmp ShowNoMatch

ShowMatch:
    mov ah, 09h
    lea dx, matchMsg
    int 21h
    ret

ShowNoMatch:
    mov ah, 09h
    lea dx, noMatchMsg
    int 21h
    ret
    
CheckBitsSet endp

end main

