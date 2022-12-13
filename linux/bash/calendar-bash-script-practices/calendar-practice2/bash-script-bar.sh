#!/bin/bash
# This script marks off/completes the to-do list

#Check if list file exists
if [ -f todo-*.txt ]; then
    echo "Which item would you like to mark off/complete?"
    read item
    sed -i "/$item/d" todo-*.txt
    echo "$item has been marked off/completed."
else
    echo "No to-do list found."
fi
