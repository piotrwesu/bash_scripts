#!/bin/bash

cdd() {
if [ -z "$1" ]; then
    echo "Usage: cdd dir_name"
    return 1 
fi

mapfile -t results < <(find ~ -type d -iname "*$1*" 2>/dev/null | sort -u)

if [[ ${#results[@]} == 0 ]]; then
    echo "Directory not found: $1"
    return 1
fi

if [[ ${#results[@]} == 1 ]]; then
    cd "${results[0]}" 
    echo "Change dir to: ${results[0]}"
else 
    echo "Found few dirs:"
    select dir in "${results[@]}"; do
        if [ -n "$dir" ]; then
            cd "$dir" 
            echo "Change dir to: $dir"
            break;
        fi
    done
fi
}
