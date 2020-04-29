extern printf
extern fflush

; 42

section .data
	s: db "extern printf%1$cextern fflush%1$c%1$c; 42%1$c%1$csection .data%1$c%2$cs: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal main%1$c%1$cmain:%1$c%2$c; Another one%1$c%2$ccall print%1$c%1$c%2$cmov rdi, 0%1$c%2$ccall fflush%1$c%1$c%2$cmov rax, 60%1$c%2$cmov rdi, 0%1$c%2$csyscall%1$c%1$cprint:%1$c%2$clea rdi, [s]%1$c%2$cmov rsi, 10%1$c%2$cmov rdx, 9%1$c%2$cmov rcx, 34%1$c%2$clea r8, [s]%1$c%2$cmov al, 0%1$c%2$ccall printf%1$c", 0

section .text
	global main

main:
	; Another one
	call print

	mov rdi, 0
	call fflush

	mov rax, 60
	mov rdi, 0
	syscall

print:
	lea rdi, [s]
	mov rsi, 10
	mov rdx, 9
	mov rcx, 34
	lea r8, [s]
	mov al, 0
	call printf
