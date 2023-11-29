.MODEL SMALL
.STACK 100H
.DATA 
   n_line DB 0DH,0AH,"$"   ;for printing new line

.CODE
   MAIN PROC
      MOV AX,@DATA        ;for moving data to data segment
      MOV DS,AX
      
      XOR BX,BX        ;initially BX value is equal to 0
      MOV CL,4      
      
      
      MOV AH,1         ;for taking input
      INT 21h
      
      
      INPUT1:
          CMP AL,0DH   ;compare whether the pressed key is 'ENTER' or not
          JE LINE1     ;If it is equal to 'Enter' then stop taking first value
         
      
          CMP AL,39h   ;compare the input whether it is letter or digit.39h is the ascii value of 9
          JG LETTER1
          
          AND AL,0FH   ;if it is digit then convert it's ascii value to real value by masking
          JMP SHIFT1
          
      LETTER1:          ;if it is letter then subtract 37h from it to find it's real value
          SUB AL,37H
       
      SHIFT1:
          SHL BX,CL    ;shift bx 4 digit left for taking next value
          OR  BL,AL    ;making 'or' will add the current value with previous value
          
          INT 21h
          JMP INPUT1
      LINE1:
          LEA DX,n_line
          MOV AH,9
          INT 21h
          
          XOR DX,DX   ;set dx value zero
          
          MOV AH,1
          INT 21h
          
      INPUT2:    ;level for taking second value as the same way talking before
          CMP AL,0DH
          JE LINE2
         
      
          CMP AL,39h
          JG LETTER2
          
          AND AL,0FH
          JMP SHIFT2
          
      LETTER2:
          SUB AL,37H
       
      SHIFT2:
          SHL DX,CL
          OR  DL,AL
          
          INT 21h
          JMP INPUT2
      LINE2:
          MOV CX,DX
              
          LEA DX,n_line
          MOV AH,9
          INT 21h
          
          MOV DH,16
      
      SUM:
          ADD BX,CX    ;add two number which are stored in bx and cs register
          JC PC1       ;if the register is overflowed then print an extra 1
      
      OUTPUT:            ;level for printing their sum
            CMP DH,0
            JE EXIT
            
            SHL BX,1
            JC P1
            JNC P0
      P1:               ;level for printing 1
        MOV DL,'1'
        MOV AH,2
        INT 21h
        SUB DH,1
        JMP OUTPUT
      P0:                 ;level for printing 0
        MOV DL,'0'
        MOV AH,2
        INT 21h
        SUB DH,1
        JMP OUTPUT
      PC1:       ;level for printing overflowed 1
        MOV DL,'1'
        MOV AH,2
        INT 21h
        JMP OUTPUT
        
      EXIT:
        RET
        
    MAIN ENDP
   END MAIN