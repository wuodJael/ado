.MODEL SMALL
.STACK 100h
.DATA
    prompt1 DB "Enter first number: $"
    prompt2 DB "Enter second number: $"
    resultSum DB "Sum: $"
    resultDiff DB "Difference: $"
    resultProd DB "Product: $"
    resultQuot DB "Quotient: $"
    newline DB 0Dh, 0Ah, "$"

    num1 DB ?  ; User input numbers
    num2 DB ?
    sum DB ?
    diff DB ?
    prod DB ?
    quot DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Get first number
    MOV DX, OFFSET prompt1
    MOV AH, 09h
    INT 21h

    MOV AH, 01h
    INT 21h
    SUB AL, '0'
    MOV num1, AL

    ; Get second number
    MOV DX, OFFSET prompt2
    MOV AH, 09h
    INT 21h

    MOV AH, 01h
    INT 21h
    SUB AL, '0'
    MOV num2, AL

    ; Addition
    MOV AL, num1
    ADD AL, num2
    ADD AL, '0'
    MOV sum, AL

    ; Subtraction
    MOV AL, num1
    SUB AL, num2
    ADD AL, '0'
    MOV diff, AL

    ; Multiplication
    MOV AL, num1
    MOV BL, num2
    MUL BL
    ADD AL, '0'
    MOV prod, AL

    ; Division
    MOV AL, num1
    MOV BL, num2
    DIV BL
    ADD AL, '0'
    MOV quot, AL

    ; Display results
    MOV DX, OFFSET resultSum
    MOV AH, 09h
    INT 21h

    MOV DL, sum
    MOV AH, 02h
    INT 21h

    MOV DX, OFFSET newline
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET resultDiff
    MOV AH, 09h
    INT 21h

    MOV DL, diff
    MOV AH, 02h
    INT 21h

    MOV DX, OFFSET newline
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET resultProd
    MOV AH, 09h
    INT 21h

    MOV DL, prod
    MOV AH, 02h
    INT 21h

    MOV DX, OFFSET newline
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET resultQuot
    MOV AH, 09h
    INT 21h

    MOV DL, quot
    MOV AH, 02h
    INT 21h

    ; Exit program
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
