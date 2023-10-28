.model small
.data 
    msg db 10, 13, "Enter the password:$"
    password db "alif$"
    match_msg db 10, 13, "Password Matched$"
    mismatch_msg db 10, 13, "Password Not Matched$"
    input_buffer db 50, ?
    input_length db 0

.code
main proc
    mov ax, @data
    mov ds, ax

input_loop:
    mov ah, 09h         
    lea dx, msg    
    int 21h 
    
    mov ah, 0Ah
    lea dx, input_buffer
    int 21h

    mov si, offset input_buffer + 2
    mov di, offset password

compare_loop:
    mov al, [si]
    mov bl, [di]

    cmp al, '$'
    je end_of_program

    cmp al, bl
    jne mismatch

    inc si
    inc di
    inc byte ptr [input_length]
    jmp compare_loop

mismatch:
    mov ah, 9
    lea dx, mismatch_msg
    int 21h
    jmp exit

end_of_program:
    mov ah, 9
    lea dx, match_msg
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp

end main