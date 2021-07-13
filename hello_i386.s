
# i386
# as -W -arch i386 -o hello_i386.o hello_i386.s
# ld -arch i386 -macosx_version_min 10.10 -o hello_i386 hello_i386.o -lSystem

# [OR]

# gcc hello_i386.s
# ./a.exe 

.text
.global _main    	#for gcc linker

_main:
	
	push %ebp	 #init frame pointer
	mov %esp, %ebp
	
	sub $0x4, %esp
	push $msg	 #push message to the stack
	call _puts       #call the puts function
	add $0x8, %esp
	
			#pop everthing from the stack
	mov $1, %eax
	pop %ebp
	ret

.data
msg:
	.ascii "Hello World!\0" #message input
	len = . - msg           #length of the input
