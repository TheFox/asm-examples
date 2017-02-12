
# i386
# as -W -arch i386 -o hello_i386.o hello_i386.s
# ld -arch i386 -macosx_version_min 10.10 -o hello_i386 hello_i386.o -lSystem

.text
.globl _main

_main:
	
	nop
	
	push %ebp
	mov %esp, %ebp
	
	sub $0x4, %esp
	push $msg
	call _puts
	add $0x8, %esp
	
	#clr %eax
	mov $1, %eax
	pop %ebp
	ret

.data
msg:
	.ascii "Hello World!\0"
	len = . - msg
