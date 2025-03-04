#!/bin/sh

#Создаем CoolLexer.cpp
flex++ -o CoolLexer.cpp ./CoolLexer.flex 

#Создаем драйвер
g++ -Wall ./driver.cpp ./CoolLexer.cpp -o driver
