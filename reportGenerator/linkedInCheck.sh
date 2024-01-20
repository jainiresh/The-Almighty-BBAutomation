#!/bin/bash


output_file="modified_text.txt"

# Replace "$REPLACE" with the input word in the text file
sed "s/\$NAME/$2/g" "$1" > "./temp.txt"
cat "$output_file"

sed "s/\$PROGRAM/$3/g" "./temp.txt" > "$output_file"
cat "$output_file"

rm "temp.txt"

xclip -selection clipboard < "$output_file"
