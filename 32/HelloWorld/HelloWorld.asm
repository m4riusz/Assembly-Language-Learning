global start

SYS_OUT equ 0x4
SYS_EXIT equ 0x1

section .data
	text: db "Hello, world!", 0xA
	.len: equ $ - text

section .text
start:
	mov eax, SYS_OUT
	push dword text.len
	push dword text
	push dword 1
	push dword eax
	int 0x80
	add esp, 16

	mov eax, SYS_EXIT
	push dword 0
	int 0x80

