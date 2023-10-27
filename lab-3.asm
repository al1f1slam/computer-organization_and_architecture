.model small
 
.data
    num db 0             ; Variable to store the user input
    prompt db "Enter an integer: $"
    pos_msg db "Positive number$"
    neg_msg db "Negative number$"
 
.code
    mov ax, @data       ; Initialize the data segment
    mov ds, ax
 
    ; Display a message to prompt the user for input
    mov ah, 09h
    lea dx, prompt
    int 21h
 
    ; Read a character from the user
    mov ah, 01h
    int 21h
 
    sub al, '0'         ; Convert ASCII to binary
 
    ; Check if the number is negative or positive
    cmp al, 0
    jl negative         ; Jump if less (negative)
    jg positive         ; Jump if greater (positive)
 
positive:
    ; Number is positive
    mov ah, 09h
    lea dx, pos_msg
    int 21h
    jmp done
 
negative:
    ; Number is negative
    mov ah, 09h
    lea dx, neg_msg
    int 21h
 
done:
    mov ah, 4Ch
    int 21h

