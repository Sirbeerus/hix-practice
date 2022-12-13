#!/bin/bash

clear

# Print calendar
echo "Today's date is:"
cal

# Ask user for filename
echo -n "Which list would you like to edit? Enter the filename: "
read listname

# Check if file exists
if [ -f $listname ]
then
	# Ask user to add, remove, or complete items
	echo -n "Would you like to add, remove, or complete items? (a/r/c): "
	read option

	# Check if user chose to add items
	if [ "$option" = "a" ]
	then
		# Ask user for items to add
		echo -n "Enter the items you would like to add, separated by commas: "
		read items

		# Split items
		IFS=',' read -ra ITEMS <<< "$items"

		# Append items to file
		for item in "${ITEMS[@]}"
		do
			echo "$item" >> $listname
		done
	
	# Check if user chose to remove items
	elif [ "$option" = "r" ]
	then
		# Ask user for items to remove
		echo -n "Enter the items you would like to remove, separated by commas: "
		read items

		# Split items
		IFS=',' read -ra ITEMS <<< "$items"

		# Remove items from file
		for item in "${ITEMS[@]}"
		do
			sed -i "/$item/d" $listname
		done

	# Check if user chose to complete items
	elif [ "$option" = "c" ]
	then
		# Ask user for items to complete
		echo -n "Enter the items you would like to complete, separated by commas: "
		read items

		# Split items
		IFS=',' read -ra ITEMS <<< "$items"

		# Place completion marker next to items
		for item in "${ITEMS[@]}"
		do
			sed -i "s/$item/[x] $item/g" $listname
		done
	
	else
		echo "Invalid option. Exiting..."
		exit 1
	fi

else
	# Ask user for items to add
	echo -n "Enter the items you would like to add to the list, separated by commas: "
	read items

	# Split items
	IFS=',' read -ra ITEMS <<< "$items"

	# Create file with current date and time
	date=$(date +"%Y-%m-%d_%H-%M-%S")
	listname=$date"_list.txt"
	touch $listname

	# Append items to new file
	for item in "${ITEMS[@]}"
	do
		echo "$item" >> $listname
	done
fi

# Print Updated List
echo "Updated List:"
cat $listname
