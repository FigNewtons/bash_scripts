#!/bin/bash

# Renames music files in a given directory
# Make sure to cd inside the target directory before running

COUNTER=1
for file in *.mp3  #Change to any extension
do
	#Removes substring preceding the last dash (-) in string 
	new=$COUNTER."${file##*-}" 
	mv "$file" "$new"
	let COUNTER=$[$COUNTER + 1]
done




