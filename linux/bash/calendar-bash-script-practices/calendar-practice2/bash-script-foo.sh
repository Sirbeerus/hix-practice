#!/bin/bash
# This script creates a to-do list

#Ask user to enter the list
echo "Enter your to-do list items. When finished, type 'done'."

#Create an array to store list items
list=()

#Get items and store them in the array
while true; do
  read item
  if [ "$item" == "done" ]; then
    break
  else
    list+=("$item")
  fi
done

#Get date and time
date=`date +%F-%H%M`

#Create a file and write list items to it
touch todo-$date.txt
for i in "${list[@]}"
do
    echo "$i" >> todo-$date.txt
done

#Print the list to the terminal
echo "Your to-do list has been created."
echo "Here is your list:"
cat todo-$date.txt
