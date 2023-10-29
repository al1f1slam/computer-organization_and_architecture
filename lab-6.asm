.model small
.stack 100h
 
.data
    character db ?
    count db 50
 
.code
    mov ax, @data
    mov ds, ax
 
    ; Display a message to prompt the user for input
    mov ah, 09h
    lea dx, prompt
    int 21h
 
    ; Read a character from the user
    mov ah, 01h
    int 21h
    mov character, al
 
    ; Display the character 50 times on the next line
    mov cx, 80
    mov ah, 02h
 
repeat_loop:
    mov dl, character
    int 21h
    loop repeat_loop
 
    ; Display a new line
    mov dl, 0Dh
    int 21h
 
    mov dl, 0Ah
    int 21h
 
    ; Exit the program
    mov ah, 09h
    lea dx, thank_you
    int 21h
 
    mov ah, 4Ch
    int 21h
 
; Data section
prompt db "Enter a character: $"
thank_you db "Thank you. $"
