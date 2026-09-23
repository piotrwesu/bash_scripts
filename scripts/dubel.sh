#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: dubel files"
    echo "Example: dubel *.jpg"
    exit 1 
fi

md5sum "$@" \
    | awk '{sum[$1]++; names[$1]=names[$1] " " $2} \
    END {for (key in sum) print sum[key] " " key ":" names[key]}' \
    | grep -v '^1 ' \
    | sort -nr
