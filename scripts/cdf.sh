#!/bin/bash

cdf() {
if [ -z "$1" ]; then
    echo "Usage: cdf filename"
    return 1 
fi

# Zbierz wszystkie katalogi z danym plikiem
mapfile -t results < <(find ~ -type f -name "$1" -printf '%h\n' | sort -u)

if [[ ${#results[@]} == 0 ]]; then
    echo "File not found: $1"
    return 1
fi

if [[ ${#results[@]} == 1 ]]; then
    cd "${results[0]}" 
    echo "Change dir to: ${results[0]}"
else 
    echo "Found few files:"
    select dir in "${results[@]}"; do
        if [ -n "$dir" ]; then
            cd "$dir" 
            echo "Change dir to: $dir"
            break;
        fi
    done
fi
}
