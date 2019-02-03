make:
	nasm -f macho32 -o FunctionPrologue.o FunctionPrologue.asm && ld -macosx_version_min 10.7.0 -lSystem -o FunctionPrologue FunctionPrologue.o
clean:
	rm FunctionPrologue.o FunctionPrologue
run: clean make
	clear
	./FunctionPrologue
