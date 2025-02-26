#!/bin/sh

FILE="test"
IDENT="\b([A-Za-z_][A-Za-z0-9_]*)\b"

grep -E -o "$IDENT" "$FILE"

