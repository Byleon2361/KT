#!/bin/sh

FILE="test"

FLOAT_HEX="0[xX][0-9a-fA-F]+(\.[0-9a-fA-F]+)?[pP][+-]?[0-9]+"
REGEXP="\b0[xX][0-9a-fA-F]+\b"
grep -E -o "$REGEXP|$FLOAT_HEX" $FILE

