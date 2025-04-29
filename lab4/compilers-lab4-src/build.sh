#!/bin/sh

CXXFLAGS="-Wall -I ./src/ -Wno-unused -Wno-deprecated  -Wno-write-strings -Wno-free-nonheap-object"

bison -d -v -y -b cool --debug -p cool_yy -o cool-bison-parser.cc cool.bison
flex -d -o cool-flex-lexer.cc ./cool.flex

g++ $CXXFLAGS -c parser-phase.cc # Тут находится main, открывавет и читает файл
g++ $CXXFLAGS -c utilities.cc -o utilities.o #
g++ $CXXFLAGS -c stringtab.cc #
g++ $CXXFLAGS -c cool-tree.cc # AST
g++ $CXXFLAGS -c cool-flex-lexer.cc # Генерация лексера
g++ $CXXFLAGS -c cool-bison-parser.cc #генерация парсера
g++ $LDFLAGS $CXXFLAGS parser-phase.o utilities.o stringtab.o cool-tree.o cool-flex-lexer.o cool-bison-parser.o -o parser #parser выводит AST
