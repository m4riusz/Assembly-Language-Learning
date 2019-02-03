section .data
	textExpectedSum db "What sum do you expect? ", 0
	textNumberOne db "Enter number one: ", 0
	textNumberTwo db "Enter number two: ", 0
	textValidSum db "Valid!", 10, 0

section .bss
	numberExpectedSum resb 2
	numberOne resb 2
	numberTwo resb 2

section .text
	STD_IN equ 0x2000003
	STD_OUT equ 0x2000004
	SYS_EXIT equ 0x2000001
	global start

start:
	mov rdi, textExpectedSum
	call _printText
	mov rdi, numberExpectedSum
	call _readNumber

	mov rdi, textNumberOne
	call _printText
	mov rdi, numberOne
	call _readNumber

	mov rdi, textNumberTwo
	call _printText
	mov rdi, numberTwo
	call _readNumber
	
	mov rdi, numberOne
	call _toInteger
	mov r12, rax

	mov rdi, numberTwo
	call _toInteger
	mov r13, rax
	
	mov rdi, numberExpectedSum
	call _toInteger
	mov r14, rax
		
	add r12, r13
	cmp r12, r14
	jne start
	
	mov rdi, textValidSum
	call _printText
	call _exit

_exit:
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall
	ret

_printText:
	push rdi
	mov rbx, 0
_printLoop:
	inc rdi
	inc rbx
	mov cl, [rdi]
	cmp cl, 0
	jne _printLoop
	
	mov rax, STD_OUT
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
	ret

_readNumber:
	mov rbx, rdi
	mov rax, STD_IN
	mov rdi, 0
	mov rsi, rbx
	mov rdx, 2
	syscall
	ret

_toInteger:
	mov rbx, rdi
	movzx rcx, byte [rbx]
	sub rcx, '0'
	mov rax, rcx
	ret
