#!/bin/bash

clear

# Prompt user to make a to-do list
echo "Please enter your to-do list items (one at a time, press enter after each item):"
read -a todo

# If no to-do list, check if completing to-do list item
if [ ${#todo[@]} -eq 0 ]; then
    echo "Do you want to complete an existing to-do list item? [y/n]"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        echo "Please enter the item you want to complete:"
        read -r complete
        echo "You have completed the item: $complete"
    fi
fi

# Prompt user to remove item on to-do
echo "Do you want to remove any item on the to-do list? [y/n]"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Please enter the item you want to remove
