.MODEL SMALL
.STACK 100h
.DATA
    msg DB "Hello, World!$"

.CODE
MAIN PROC
    MOV AX, @DATA   ; Load data segment
    MOV DS, AX

    MOV DX, OFFSET msg  ; Load message address
    MOV AH, 09h        ; DOS function to print string
    INT 21h            ; Call DOS interrupt

    MOV AH, 4Ch        ; DOS terminate function
    INT 21h
MAIN ENDP
END MAIN
