#!/bin/sh

FILE="test"
REGEXP="#(define|undef|include|error|warning|pragma|line|if|ifdef|ifndef|else|elif|elifdef|elifnde|endif)"
grep -E $REGEXP $FILE

