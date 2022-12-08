all:
	nasm -f elf64 -o echo.o echo.asm
	ld -o echo-vuln echo.o
	./echo-vuln

