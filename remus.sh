#!/bin/bash

# Renames music files in a given directory based on extension
# provided by the user (ex: bash remus.sh mp3)
# Make sure to cd inside the target directory before running

EXT=$1
COUNTER=1
for file in *.$EXT  #Change to any extension
do
	#Removes substring preceding the last dash (-) in string 
	new=$COUNTER."${file##*-}" 
	mv "$file" "$new"
	let COUNTER=$[$COUNTER + 1]
done



