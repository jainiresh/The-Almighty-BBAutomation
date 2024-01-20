#!/bin/bash

template_dir="/home/jai/Documents/reports/templates"

if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_word> <input_file>"
    exit 1
fi

input_word="$1"
input_file="$2"

# DEBUG
# echo "File : $template_dir/$input_file.txt"

if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

output_file="modified_text.txt"

# Replace "$REPLACE" with the input word in the text file
sed "s/\$REPLACE/$input_word/g" "$input_file" > "$output_file"

echo "Replacement completed. Output saved to '$output_file'."
echo "$output_file"w

xclip -selection clipboard < "$output_file"

