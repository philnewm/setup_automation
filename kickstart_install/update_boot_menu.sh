#!/bin/bash

# Input and output file names
input_file="/tmp/workdir/isolinux/isolinux.cfg"
output_file="/tmp/workdir/isolinux/out_isolinux.cfg"

# Flag to indicate if the desired block has been found
found_block=false

# Read input file line by line
while IFS= read -r line; do
    if [[ "$line" == *"label linux"* ]]; then
        found_block=true

        if [ -f "$output_file" ]; then
            sudo rm "$output_file"
        fi

        sudo touch "$output_file"
    fi

    if [ "$found_block" == true ]; then
        # Add the current line and the next indented lines to the output
        echo "$line" | sudo tee -a "$output_file"
        
        # Check for an empty line
        if [ -z "$line" ]; then
            # Break the loop when an empty line is encountered
            break
        fi
    fi
done < "$input_file"

# Insert the block after the last line read
awk -v var="$(cat $output_file)" '/./{line=$0; if (p) print p; p=line} END{print var}' "$input_file" > temp && sudo mv -f temp "$input_file"

echo "Operation complete. Result saved in $input_file."
