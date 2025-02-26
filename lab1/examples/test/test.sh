#!/bin/sh
BINARY_REGEXP="\b(0[bB][01]+)*\b"
OCTAL_REGEXP="\b0[0-7]+\b"
HEX="\b0[xX][0-9a-fA-F]+\b"
Decimal="\b[1-9][0-9]*('?[0-9]+)*(ull|ULL|llu|LLU|uLL|LLu)\b"
SIZE_T="\b[1-9][0-9]('?[0-9])*(ull|ULL|llu|LLU|uLL|LLu)\b"
for f in `find $DIR -name test.cpp`; do
    echo "*** File $f"
    echo "Binary numbers:"
    grep -o -E "$BINARY_REGEXP" $f 
    echo "Octal numbers:"
    grep -o -E "$OCTAL_REGEXP" $f 
    echo "Hex numbers:"
    grep -o -E "$HEX|$FLOAT_HEX" $f 
    echo "Decimal numbers:"
    grep -o -P "$Decimal|$HEX|$OCTAL_REGEXP|$BINARY_REGEXP $f | grep -o -E $SIZE_T" $f
     echo "Float numbers:"
    grep -o -E "$FLOAT" $f 

done