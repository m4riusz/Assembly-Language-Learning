section .data
	question db "What is your name?", 10
	summary db "Hello, "	

section .bss
	name resb 16

section .text
	global start

start:
	call _askForName
	call _readName
	call _printSummary
	mov rax, 0x2000001
	mov rdi, 0
	syscall

_askForName:
	mov rax, 0x2000004
	mov rdi, 1
	mov rsi, question
	mov rdx, 19
	syscall
	ret

_readName:
	mov rax, 0x2000003
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_printSummary:
	mov rax, 0x2000004
	mov rdi, 1
	mov rsi, summary
	mov rdx, 7
	syscall
	mov rax, 0x2000004
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret
