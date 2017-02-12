
.PHONY: all
all: hello_i386 hello_x64

hello_i386.o: hello_i386.s
	as -W -arch i386 -o $@ $<

hello_i386: hello_i386.o
	ld -arch i386 -macosx_version_min 10.10 -o $@ $< -lSystem

hello_x64.o: hello_x64.s
	as -W -arch x86_64 -o $@ $<

hello_x64: hello_x64.o
	ld -arch x86_64 -macosx_version_min 10.10 -e _main -o $@ $< -lSystem

.PHONY: clear
clear: 
	rm -f *.o hello_i386 hello_x64
