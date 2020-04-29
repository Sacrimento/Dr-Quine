%define foo
%define bar
%define baz

extern dprintf
; 42

%macro _main 0
	mov rax, 2
	lea rdi, [path]
	mov rsi, 65
	mov rdx, 0644o
	syscall
	cmp rax, 0
	push rax
	jg write
	jmp exit

write:
	mov rdi, rax
	lea rsi, [s]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	lea r9, [s]
	mov al, 0
	call dprintf
	mov rax, 3
	pop rdi
	syscall
	push 0

exit:
	mov rax, 60
	pop rdi
	syscall
%endmacro

section .data
	path: db "Grace_kid.s", 0
	s: db "%%define foo%1$c%%define bar%1$c%%define baz%1$c%1$cextern dprintf%1$c; 42%1$c%1$c%%macro _main 0%1$c%2$cmov rax, 2%1$c%2$clea rdi, [path]%1$c%2$cmov rsi, 65%1$c%2$cmov rdx, 0644o%1$c%2$csyscall%1$c%2$ccmp rax, 0%1$c%2$cpush rax%1$c%2$cjg write%1$c%2$cjmp exit%1$c%1$cwrite:%1$c%2$cmov rdi, rax%1$c%2$clea rsi, [s]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$clea r9, [s]%1$c%2$cmov al, 0%1$c%2$ccall dprintf%1$c%2$cmov rax, 3%1$c%2$cpop rdi%1$c%2$csyscall%1$c%2$cpush 0%1$c%1$cexit:%1$c%2$cmov rax, 60%1$c%2$cpop rdi%1$c%2$csyscall%1$c%%endmacro%1$c%1$csection .data%1$c%2$cpath: db %3$cGrace_kid.s%3$c, 0%1$c%2$cs: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal main%1$c%1$cmain: _main%1$c", 0

section .text
	global main

main: _main
