#!/bin/sh

FILE="test"

REGEXP="\b([1-9][0-9]*(?:'[0-9]+)*(?:[uU]?[lL]{1,2}|[lL]{1,2}[uU]?)?)\b"

OCT="\b0[0-7]+\b"

grep -Pv $REGEXP $FILE | grep -P -o $OCT


