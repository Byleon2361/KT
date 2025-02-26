#!/bin/sh

FILE="test"
REGEXP="'([^'\\]|\\.)'"
grep -E -o $REGEXP $FILE
