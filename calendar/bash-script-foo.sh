#!/bin/bash

clear

# Print calendar
echo "Today's date is:"
cal

echo "Please enter the name of the to-do list file: "
read filename

if [ -f $filename ]; then
    while true; do
        echo "What would you like to do with the file? (add/complete/remove): "
        read action

        if [ $action = "add" ]; then
            echo "What would you like to add to the file? "
            read input
            echo $input >> $filename
            echo "Successfully added to file!"
        elif [ $action = "complete" ]; then
            echo "What would you like to complete in the file? "
            read input
            sed -i "s/$input/[x]$input/" $filename
            echo "Successfully completed!"
        elif [ $action = "remove" ]; then
            echo "What would you like to remove from the file? "
            read input
            sed -i "/$input/d" $filename
            echo "Successfully removed!"
        else
            echo "Not a valid action. Please try again."
        fi
    done
else
    echo "File not found. Creating new to-do list..."
    echo "What would you like to add to the file? (Enter q to quit)"
    while read input; do
        if [ $input = "q" ]; then
            break
        else
            echo $input >> $filename
        fi
    done
    echo "Successfully created file!"
fi

# Append date to end of file
date_str=$(date -r $filename +"%Y-%m-%d")
echo "List last updated on $date_str" >> $filename

# Output to-do list
cat $filename
