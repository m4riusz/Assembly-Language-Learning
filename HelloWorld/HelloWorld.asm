STD_OUT equ 0x2000004
SYS_EXIT equ 0x2000001

section .data
	text db "Hello, World!", 10

section .text
	global start

start:
	mov rax, STD_OUT
	mov rdi, 1
	mov rsi, text
	mov rdx, 14
	syscall
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall
