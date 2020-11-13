extern sprintf
extern dprintf
extern system

section .bss
	path: resb 4096
	cmd: resb 4096
	exec: resb 4096

section .data
	X: dq 5
	fmt_path: db "Sully_%d.s", 0
	fmt_cmd: db "nasm -f elf64 -o Sully_%d.o Sully_%1$d.s; clang -o Sully_%1$d Sully_%1$d.o; rm -f *.o", 0
	fmt_exec: db "./Sully_%1$d", 0
	s: db "extern sprintf%1$cextern dprintf%1$cextern system%1$c%1$csection .bss%1$c%2$cpath: resb 4096%1$c%2$ccmd: resb 4096%1$c%2$cexec: resb 4096%1$c%1$csection .data%1$c%2$cX: dq %4$d%1$c%2$cfmt_path: db %3$cSully_%%d.s%3$c, 0%1$c%2$cfmt_cmd: db %3$cnasm -f elf64 -o Sully_%%d.o Sully_%%1$d.s; clang -o Sully_%%1$d Sully_%%1$d.o; rm -f *.o%3$c, 0%1$c%2$cfmt_exec: db %3$c./Sully_%%1$d%3$c, 0%1$c%2$cs: db %3$c%5$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal main%1$c%1$cmain:%1$c%2$cmov r12, [X]%1$c%2$ccmp r12, 0%1$c%2$cjl no_error%1$c%2$ccmp r12, 4096%1$c%2$cjg error%1$c%2$cmov r14, r12%1$c%2$cdec r12%1$c%1$c%2$clea rdi, [path]%1$c%2$clea rsi, [fmt_path]%1$c%2$cmov rdx, r14%1$c%2$cmov al, 0%1$c%2$ccall sprintf%1$c%1$c%2$cmov rax, 2%1$c%2$clea rdi, [path]%1$c%2$cmov rsi, 65%1$c%2$cmov rdx, 0644o%1$c%2$csyscall%1$c%2$ccmp rax, 0%1$c%2$cjle error%1$c%2$cmov r13, rax%1$c%1$c%2$cmov rdi, rax%1$c%2$clea rsi, [s]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, r12%1$c%2$cpush dword s%1$c%2$cmov al, 0%1$c%2$ccall dprintf%1$c%1$c%2$cmov rax, 3%1$c%2$cmov rdi, r13%1$c%2$csyscall%1$c%1$c%2$clea rdi, [cmd]%1$c%2$clea rsi, [fmt_cmd]%1$c%2$cmov rdx, r14%1$c%2$cmov al, 0%1$c%2$ccall sprintf%1$c%1$c%2$clea rdi, [cmd]%1$c%2$ccall system%1$c%1$c%2$ccmp r14, 0%1$c%2$cjle no_error%1$c%1$c%2$clea rdi, [exec]%1$c%2$clea rsi, [fmt_exec]%1$c%2$cmov rdx, r14%1$c%2$cmov al, 0%1$c%2$ccall sprintf%1$c%1$c%2$clea rdi, [exec]%1$c%2$ccall system%1$c%1$c%2$cjmp no_error%1$c%1$cerror:%1$c%2$cpush 1%1$c%2$cjmp exit%1$c%1$cno_error:%1$c%2$cpush 0%1$c%2$cjmp exit%1$c%1$cexit:%1$c%2$cmov rax, 60%1$c%2$cpop rdi%1$c%2$csyscall%1$c", 0

section .text
	global main

main:
	mov r12, [X]
	cmp r12, 0
	jl no_error
	cmp r12, 4096
	jg error
	mov r14, r12
	dec r12

	lea rdi, [path]
	lea rsi, [fmt_path]
	mov rdx, r14
	mov al, 0
	call sprintf

	mov rax, 2
	lea rdi, [path]
	mov rsi, 65
	mov rdx, 0644o
	syscall
	cmp rax, 0
	jle error
	mov r13, rax

	mov rdi, rax
	lea rsi, [s]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	mov r9, r12
	push dword s
	mov al, 0
	call dprintf

	mov rax, 3
	mov rdi, r13
	syscall

	lea rdi, [cmd]
	lea rsi, [fmt_cmd]
	mov rdx, r14
	mov al, 0
	call sprintf

	lea rdi, [cmd]
	call system

	cmp r14, 0
	jle no_error

	lea rdi, [exec]
	lea rsi, [fmt_exec]
	mov rdx, r14
	mov al, 0
	call sprintf

	lea rdi, [exec]
	call system

	jmp no_error

error:
	push 1
	jmp exit

no_error:
	push 0
	jmp exit

exit:
	mov rax, 60
	pop rdi
	syscall
