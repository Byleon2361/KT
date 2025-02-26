#!/bin/sh

FILE="test"
FLOAT_DECIMAL="[+-]?((([0-9]*\.[0-9]+)|([0-9]+\.[0-9]*))([eE][+-]?[0-9]+)?[fFdDlL]?)"
FLOAT_EXPONENT="[+-]?[0-9]+[eE][+-]?[0-9]+[fFdDlL]?"
FLOAT_HEX="0[xX][0-9a-fA-F]+(\.[0-9a-fA-F]+)?[pP][+-]?[0-9]+"
FLOAT_BF16="[0-9]+(\.[0-9]+)?[fF]64BF16"
REGEXP="($FLOAT_DECIMAL|$FLOAT_EXPONENT|$FLOAT_HEX|$FLOAT_BF16)"

grep -P -o "$REGEXP" "$FILE"

