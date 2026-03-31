#!/bin/bash

# Check if correct number of arguments is provided
if [ $# -ne 4 ]; then
    echo "Usage: $0 <base_text> <start_number> <end_number>"
    exit 1
fi

BASENAME="$1"
START="$2"
END="$3"
BASEFILE="$4"

# Create files from start to end (inclusive)
for n in $(seq "$START" "$END"); do
    filename="${BASENAME}_${n}.tres"
    cp "$BASEFILE" "$filename"
    echo "Created file: $filename"
done
