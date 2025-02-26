#!/bin/sh

FILE="test"
BIN="\b0b[01]+\b"
OCT="\b0[0-7]+\b"
HEX="\b0[xX][0-9A-Fa-f]+\b"
FP="\b[0-9]+\.([0-9]+|[0-9]+[eE]-[0-9]+)f?\b"
DECIMAL="\b([1-9][0-9]*(?:'[0-9]+)*(?:[uU]?[lL]{1,2}|[lL]{1,2}[uU]|[Z]?)?)\b"


FILE="test"
FLOAT_DECIMAL="[+-]?((([0-9]*\.[0-9]+)|([0-9]+\.[0-9]*))([eE][+-]?[0-9]+)?[fFdDlL]?)"
FLOAT_EXPONENT="[+-]?[0-9]+[eE][+-]?[0-9]+[fFdDlL]?"
FLOAT_HEX="0[xX][0-9a-fA-F]+(\.[0-9a-fA-F]+)?[pP][+-]?[0-9]+"
FLOAT_BF16="[0-9]+(\.[0-9]+)?[fF]64BF16"
FP="($FLOAT_DECIMAL|$FLOAT_EXPONENT|$FLOAT_HEX|$FLOAT_BF16)"

grep -Pv $FP $FILE | grep -P -o "$BIN|$OCT|$HEX|$DECIMAL"

