STD_OUT equ 0x2000004
SYS_EXIT equ 0x2000001

section .data
	text db "Example text", 10, 0

section .text
	global start

start:
	mov rax, text
	call _print
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

_print:
	push rax
	mov rbx, 0
_printLoop:
	inc rax
	inc rbx
	mov dl, [rax]
	cmp dl, 0
	jne _printLoop
	
	mov rax, STD_OUT
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
	ret
