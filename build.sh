#!/bin/sh
mkdir -p generated
mkdir -p build
flex --header-file=generated/lex.yy.h --outfile=generated/lex.yy.c src/tin.l
bison -d -b generated/parser src/tin.y
gcc -D TIN_INTERPRETER -Isrc -Igenerated -Werror -g -O0 src/*.c generated/lex.yy.c generated/parser.tab.c -o build/tin