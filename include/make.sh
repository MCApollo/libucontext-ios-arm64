#!/bin/bash -x
# Run on a real device to find offsets
set -e
: ${CC:=aarch64-apple-darwin17-clang}

cat defs.sym | \
${CC} -isystem ../ -o defines -x c - 
