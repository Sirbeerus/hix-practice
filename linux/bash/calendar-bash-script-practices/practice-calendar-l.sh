#!/bin/bash

clear

# Print calendar
echo "Today's date is:"
cal
echo ""

echo "What would you like to do? (Make/Remove/Complete)"
read choice

if [ "$choice" == "Make" ]; then
    echo "Please enter the name of your to-do list:"
    read listname
    echo "Please enter the item(s) you wish to add:"
    read item
    echo "$item" >> $listname
    echo "Your item has been added to the list."

elif [ "$choice" == "Remove" ]; then
    echo "Please enter the name of your to-do list:"
    read listname
    echo "Please enter the item(s) you wish to remove:"
    read item
    grep -v "$item" $listname > temp && mv temp $listname
    echo "Your item has been removed from the list."

elif [ "$choice" == "Complete" ]; then
    echo "Please enter the name of your to-do list:"
    read listname
    echo "Please enter the item(s) you wish to complete:"
    read item
    sed -i "/$item/s/$/ - Completed/" $listname
    echo "Your item has been marked as completed."

else
    echo "Invalid input."
fi
