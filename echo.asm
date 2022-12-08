section .data
	errMsg: db "Usage: ./echo-vuln <text>", 0xA
	errMsgLen: equ $-errMsg
section .bss
	data: resb ""
section .text
	global _start
	
_start:
	pop rcx
	cmp rcx, 2
	jne .errNotEnoughArgs
	mov r8, [rsp+8]
	mov [data], r8
	jmp .print
.errNotEnoughArgs:
	mov rax, 1
	mov rdi, 1
	mov rsi, errMsg
	mov rdx, errMsgLen
	syscall
	jmp .exitErr
.print:
	mov rax, 1
	mov rdi, 1
	mov rsi, [data]
	mov rdx, 512
	syscall
	jmp .exit
.exitErr:
	mov rax, 60
	mov rbx, 1
	syscall
.exit:
	mov rax, 60
	mov rbx, 0
	syscall

