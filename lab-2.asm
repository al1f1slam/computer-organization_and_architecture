.model small 

.data 

    helloMsg db "Hello World", 13, 10, "$" 

    byeMsg db "Bye World", 13, 10, "$" 

    count db 5  ; Initialize a counter to 5 

 

.code 

main proc 

    mov ax, @data 

    mov ds, ax 

 

    ; Loop to print "Hello World" 5 times 

    mov cx, 5  ; Set the loop counter to 5 

printHelloLoop: 

    mov ah, 09h 

    lea dx, helloMsg 

    int 21h 

 

    dec byte ptr [count]  ; Decrement the counter 

    jnz printHelloLoop  ; Jump if the counter is not zero 

 

    ; Print "Bye World" 

    mov ah, 09h 

    lea dx, byeMsg 

    int 21h 

 

    ; End the program 

    mov ah, 4Ch 

    int 21h 

 

main endp 

 

end main 