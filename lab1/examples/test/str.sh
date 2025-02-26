#!/bin/sh

FILE="test"
REGEXP="[R|L|LR|u8|u8R|u|uR|U|UR]?\"(.*)\""
grep -E -o $REGEXP $FILE