#!/bin/bash

# Renames music files in a given directory based on extension
# provided by the user (ex: bash remus.sh mp3)

# Ex: 01.Song.mp3, 01 Band - Song.mp3, etc. ----> 1.Song.mp3

# Make sure to cd inside the target directory before running

# Use at your own discretion! 

EXT=$1
COUNTER=1
for file in *.$EXT  #Change to any extension
do
	if [[ "$file" == *-* ]]
	then
		#Removes substring preceding the last dash (-) in string 
		str="${file##*-}" 

	# Check if occurrence of '.' in file is greater than one (.$EXT)
	elif [ $(grep -o '\.' <<< $file | grep -c '\.') -gt 1 ]
	then
		#Removes substring preceding the first period (.) in string 
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
	#mv "$file" "$new"
	echo "$new"
	#Create playlist
	#echo "$new" >> playlist.m3u

	let COUNTER=$[$COUNTER + 1]
done



