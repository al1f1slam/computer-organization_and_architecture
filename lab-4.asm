.model small
org 100h
.data
    input_msg db 'Enter an integer: $'
    less_msg db 'Less than 5', 13, 10, '$'
    greater_msg db 'Greater than 5', 13, 10, '$'
    equal_msg db 'Equal to 5', 13, 10, '$'

.code
main proc
    mov ah, 09h  ; Display the input message
    mov dx, offset input_msg
    int 21h

    mov ah, 01h  ; Read a character from the user
    int 21h

    sub al, '0'  ; Convert ASCII character to integer

    cmp al, 5  ; Compare the entered integer with 5
    jl less_than
    jg greater_than
    je equal_to

less_than:
    mov ah, 02h
    mov dl, 13
    int 21h
  
    mov dl, 10
    int 21h 

    mov ah, 09h  ; Display "Less than 5" message
    mov dx, offset less_msg
    int 21h
    jmp exit

greater_than:

    mov ah, 02h
    mov dl, 13
    int 21h
  
    mov dl, 10
    int 21h 
    
    mov ah, 09h  ; Display "Greater than 5" message
    mov dx, offset greater_msg
    int 21h 
    jmp exit

equal_to:  
    mov ah, 02h
    mov dl, 13
    int 21h
  
    mov dl, 10
    int 21h

    mov ah, 09h  ; Display "Equal to 5" message
    mov dx, offset equal_msg
    int 21h

   
exit:
    mov ah, 4Ch  ; Exit the program
    int 21h
main endp

end main