#!/bin/bash

# Renames music files in a given directory based on extension
# provided by the user (ex: bash remus.sh mp3)

# Ex: 01.Song.mp3, 01 Band - Song.mp3, etc. ----> 1.Song.mp3

# Make sure to cd inside the target directory before running

EXT=$1
COUNTER=1
for file in *.$EXT  #Change to any extension
do
	if [[ "$file" == *-* ]]
	then
		#Removes substring preceding the last dash (-) in string 
		str="${file##*-}" 

	elif [[ "$file" == *.* ]]
	then
		#Removes substring preceding the first dash (.) in string 
		str="${file#*.}" 

	elif [[ "$file" == [0-9][0-9]* ]]
	then 
		#Removes two-digit numbering from file name
		str=$(echo $file | sed 's/[0-9][0-9]//g')
	else
		str="$file"
	fi
	
	#Rename file	
	new=$COUNTER."$str"
	mv "$file" "$new"

	let COUNTER=$[$COUNTER + 1]
done



