make: 
	nasm -f macho64 -o HelloWorld.o HelloWorld.asm && ld -macosx_version_min 10.7.0 -lSystem -o HelloWorld HelloWorld.o
clean:
	rm HelloWorld.o HelloWorld
run: clean make
	clear
	./HelloWorld
