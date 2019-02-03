SYS_EXIT equ 0x1
SYS_OUT equ 0x4

section .text
	global start

start:
	push 10
	push 2
	call add
	call exit

add:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	add eax, ebx
	mov esp, ebp
	pop ebp
	ret

exit:
	mov eax, SYS_EXIT
	int 0x80
	
