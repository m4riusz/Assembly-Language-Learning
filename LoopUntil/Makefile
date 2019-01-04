make: 
	nasm -f macho64 -o LoopUntil.o LoopUntil.asm && ld -macosx_version_min 10.7.0 -lSystem -o LoopUntil LoopUntil.o
clean:
	rm LoopUntil.o LoopUntil
run: clean make
	clear
	./LoopUntil
