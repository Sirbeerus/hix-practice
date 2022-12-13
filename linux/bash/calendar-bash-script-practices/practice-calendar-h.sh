#!/bin/bash

clear

# Print calendar
echo "Today's date is:"
cal

# Ask the user if they want to make a to-do list, complete items from a given file, or remove items from a given file
echo "Would you like to make a to-do list, complete items from a given file, or remove items from a given file?"
echo " make a to-do list     complete items from a given file    remove items from a given file "
read answer

if [ "$answer" == "make a to-do list" ]; then
  echo "What would you like to add to the list?"
  read todo
  # Append to-do list to file
  echo "$todo" >> to-do.txt
  echo "Your item has been added to the list"
elif [ "$answer" == "complete items from a given file" ]; then
  echo "What item would you like to complete?"
  read item
  # Place the 'x' next to the item
  sed -i "s/$item/x $item/g" to-do.txt
  echo "Your item has been marked as completed"
elif [ "$answer" == "remove items from a given file" ]; then
  echo "What item would you like to remove?"
  read item
  # Delete the item from the list
  sed -i "/$item/d" to-do.txt
  echo "Your item has been removed from the list"
else
  echo "Sorry, that is not a valid option"
fi

# Append date to file
date -r to-do.txt >> to-do.txt
