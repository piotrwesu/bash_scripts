#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: dubel files"
    echo "Example: dubel *.jpg"
    exit 1 
fi

md5sum "$@" | cut -c1-32 | sort | uniq -c | sort -nr | grep -v " 1"
