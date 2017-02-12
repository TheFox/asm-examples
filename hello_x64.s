
# x86_64
# as -W -arch x86_64 -o hello_x64.o hello_x64.s
# ld -arch x86_64 -macosx_version_min 10.10 -e _main -o hello_x64 hello_x64.o -lSystem

.text
.globl _main

_main:
	push %rbp
	mov %rsp, %rbp
	sub $0x10, %rsp
	
	mov msg@GOTPCREL(%rip), %rdi
	call _puts
	
	pop %rbp
	
Lend:
	mov $0x2000001, %rax
	mov $0x0, %rdi
	syscall

.data
msg:
	.ascii "Hello World!\0"
	len = . - msg
