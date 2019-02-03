STD_OUT equ 0x2000004
STD_IN equ 0x2000003
SYS_EXIT equ 0x2000001

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
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

_askForName:
	mov rax, STD_OUT
	mov rdi, 1
	mov rsi, question
	mov rdx, 19
	syscall
	ret

_readName:
	mov rax, STD_IN
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_printSummary:
	mov rax, STD_OUT
	mov rdi, 1
	mov rsi, summary
	mov rdx, 7
	syscall
	mov rax, STD_OUT
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret
