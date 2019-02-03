make:
	nasm -f macho64 -o TextInput.o TextInput.asm && ld -macosx_version_min 10.7.0 -lSystem -o TextInput TextInput.o
clean:
	rm TextInput.o TextInput
run: clean make
	clear
	./TextInput
