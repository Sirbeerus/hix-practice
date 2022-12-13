#!/bin/bash

#This script will check if user wants to make a to-do list or complete items.
echo "Do you want to make a to-do list or complete items from the list? (make/complete)"
read choice

#If user wants to make a to-do list
if [ $choice == "make" ]
then
	echo "Enter items for your to-do list (enter 'done' when finished):"
	read item
	
	# Create an empty file and name it with the current date
	filename=$(date +"%d-%m-%y")
	touch $filename
	
	#Loop until user enters "done"
	while [ $item != "done" ]
	do
		# Append items to the file
		echo $item >> $filename
		echo "Enter items for your to-do list (enter 'done' when finished):"
		read item
	done
	
	# Output the list to the file
	echo "Your to-do list is:"
	cat $filename
	
# If user wants to complete items
elif [ $choice == "complete" ]
then
	echo "Enter items to delete from the list (enter 'done' when finished):"
	read item
	
	#Loop until user enters "done"
	while [ $item != "done" ]
	do
		# Delete the entered item from the list
		sed -i "/$item/d" $filename
		echo "Enter items to delete from the list (enter 'done' when finished):"
		read item
	done
	# Output the list to the file
	echo "Your updated to-do list is:"
	cat $filename
	
else
	echo "Invalid input"
fi
