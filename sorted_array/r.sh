#/bin/bash

#Delete some un-needed files
rm *.o
rm *.out

nasm -f elf64 -l -o manage.o manager.asm

nasm -f elf64 -l -o input.o input_array.asm

nasm -f elf64 -l -o output.o output_array.asm

nasm -f elf64 -l -o swap.o swap.asm

gcc  -m64 -Wall -no-pie -o sort.o -std=c2x -c sort.c

gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

g++ -m64 -no-pie -o arr.out manage.o input.o swap.o sort.o output.o main.o -std=c2x -Wall -z noexecstack -lm

chmod +x arr.out
./arr.out
