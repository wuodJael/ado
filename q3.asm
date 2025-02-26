section .data
    message db "Hello, World!", 0   ; Store the message in the .data segment

section .bss
    buffer resb 20                  ; Reserve space for a message in .bss

section .text
    global _start

_start:
    ; Copy the message from .data to .bss (simulating runtime data manipulation)
    mov esi, message
    mov edi, buffer
    mov ecx, 13  ; Length of "Hello, World!"
    rep movsb    ; Copy message from .data to .bss

    ; Print the message from .bss
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, buffer     ; Message from .bss segment
    mov edx, 13         ; Message length
    int 0x80            ; Call kernel

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Call kernel
