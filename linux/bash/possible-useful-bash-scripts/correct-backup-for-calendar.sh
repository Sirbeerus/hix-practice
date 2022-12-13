#!/bin/bash

# Print calendar
echo "Today's date is:"
cal

# Ask if user wants to make to-do list or complete items from a given file
echo
echo "Do you want to make a to-do list or complete items from a given file? (Type 'list' for to-do list or 'file' for items from file)"
read userInput

# Create to-do list
if [ "$userInput" == "list" ]; then
	echo
	echo "Enter items for your to-do list (enter 'done' when finished):"
	
	# Create empty array
	list=()
	
	# Read user input
	while true; do
		read item
		
		if [ "$item" == "done" ]; then
			break
		else
			list+=($item)
		fi
	done
	
	# Output to-do list to file
	echo
	echo "Writing list to file..."
	date=$(date -r)
	echo "To-Do List ($date):" > to-do.txt
	for i in "${list[@]}"
	do
		echo $i >> to-do.txt
	done

# Complete items from given file
elif [ "$userInput" == "file" ]; then
	echo
	echo "Enter the file name:"
	read fileName
	
	# Check if file exists
	if [ -f $fileName ]; then
		echo
		echo "Enter the items to complete (enter 'done' when finished):"
		
		# Create empty array
		list=()
		
		# Read user input
		while true; do
			read item
			
			if [ "$item" == "done" ]; then
				break
			else
				list+=($item)
			fi
		done
		
		# Remove items from file
		echo
		echo "Removing items from file..."
		for i in "${list[@]}"
		do
			sed -i "/$i/d" $fileName
		done
	else
		echo
		echo "Error: File not found!"
	fi
else
	echo
	echo "Error: Invalid input!"
fi
