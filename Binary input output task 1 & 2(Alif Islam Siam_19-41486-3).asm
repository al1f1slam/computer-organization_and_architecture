.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "BINARY :$"
MSG DB 0DH,0AH,"$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    MOV AH,9
    LEA DX,MSG1
    INT 21H
   
    XOR BX,BX
 
 
  MOV AH,1
  INT 21H
 
 
WHILE:
  CMP AL,0DH
  JE END_WHILE
  AND AL,0FH
  SHL BX,1
  OR BL,AL
  INT 21H
  JMP WHILE
   
   END_WHILE:
   MOV CX,16
 
   MOV AH,9
   LEA DX,MSG
   INT 21H
   
    L:
    ROL BX,1
    JNC ZERO
    MOV DL,31H
    JMP DISPLAY
   
    ZERO:
    MOV DL,30H
    JMP DISPLAY
   
    DISPLAY:
    MOV AH,2
    INT 21H
    LOOP L
   
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN