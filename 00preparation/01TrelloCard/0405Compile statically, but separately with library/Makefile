all:
	gcc -ffunction-sections -fdata-sections -c t.c
	gcc -ffunction-sections -fdata-sections -c lib.c
	gcc -Wl,--gc-sections -o out t.o lib.o
	objdump -ht out
