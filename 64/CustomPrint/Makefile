make:
	nasm -f macho64 -o CustomPrint.o CustomPrint.asm && ld -macosx_version_min 10.7.0 -lSystem -o CustomPrint CustomPrint.o
clean:
	rm CustomPrint.o CustomPrint
run: clean make
	clear
	./CustomPrint
