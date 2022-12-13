#!/bin/bash

# This script will make a to-do list from user inputs.
# It will also be able to delete items from the list.
# The list will be outputted to a file in the date -r format.

# Create the to-do list array
declare -a to_do_list

# Create functions

# Function to add items to the to-do list
add_to_list() {
	echo "What item would you like to add to the to-do list?"
	read item
	to_do_list+=("$item")
	echo "Your item has been added to the list."
}

# Function to remove items from the to-do list
remove_from_list() {
	echo "What item would you like to remove from the to-do list?"
	read item
	unset to_do_list["$item"]
	echo "Your item has been removed from the list."
}

# Function to output the to-do list to a file
output_to_file() {
	echo "Your to-do list will be outputted"
