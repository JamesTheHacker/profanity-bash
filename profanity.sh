#!/bin/bash

# Loop through each input word
for word in $1; do

    # Convert word to lowercase and remove punctuation
    lowercase=$(echo $word | tr 'A-Z' 'a-z' | tr -d '[:punct:]')
    
    # Check if the word is in the banned words list
    if grep -Fxq "$lowercase" banned_words.txt
    then
	len=${#word}
	replaced_word=$(for((i=0; i<$len; i++)); do echo -n '#'; done)
        output="$output $replaced_word"
    else
	output="$output $word"
    fi
done

echo $output
