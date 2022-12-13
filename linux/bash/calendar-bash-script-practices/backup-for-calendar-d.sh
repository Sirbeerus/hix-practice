#!/bin/bash

clear

# Print calendar
echo "Today's date is:"
cal

# Ask user for input
echo "Please enter input (a, b, c, or d):"
echo "a. Make a to-do list from user inputs."
echo "b. Make a to-do list from a given file."
echo "c. Complete items from a given file."
echo "d. Remove items from a given file."
read input

# Set file
echo "Please enter file name:"
read filename

# Make to-do list from user inputs
if [ "$input" == "a" ]; then
	echo "Please enter to-do items one by one. Press ENTER to save each item and type 'done' when finished."
	echo ""
	echo "To-do list:"
	> $filename
	while true; do
		read item
		if [ "$item" == "done" ]; then
			break
		fi
		echo $item >> $filename
                echo "$item, saved!" 
	done
	echo "To-do list is saved in $filename"
# Make a to-do list from a given file
elif [ "$input" == "b" ]; then
	echo "Please enter file name:"
	read filename
	echo "To-do list:"
	cat $filename
	echo ""
	echo "To-do list is saved in $filename"
# Complete items from a given file
elif [ "$input" == "c" ]; then
	echo "Please enter item to complete:"
	read item
	echo "Completed: $item"
	sed -i "/^$item/s/$/ - Completed/" $filename
	echo "Updated to-do list:"
	cat $filename
	echo ""
	echo "To-do list is saved in $filename"
# Remove items from a given file
elif [ "$input" == "d" ]; then
	echo "Please enter item to remove:"
	read item
	echo "Removed: $item"
	sed -i "/^$item/d" $filename
	echo "Updated to-do list:"
	cat $filename
	echo ""
	echo "To-do list is saved in $filename"

# Print error if user inputs incorrect value
else
	echo "Error: Please enter a valid input (a, b, c, or d)."
fi

#Adds date "-r" to outputed files
mv $filename $filename"_"`date +"%d-%m-%Y"`