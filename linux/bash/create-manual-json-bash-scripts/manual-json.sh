#!/bin/bash
echo "Are you making a new JSON file or editing an existing one? (n/e)"
read answer

if [ "$answer" = "n" ]; then
    echo "What is the filename?"
    read filename
    echo "$filename.json"
    echo "Are you making a JSON object or JSON array? (o/a)"
    read response
    if [ "$response" = "o" ]; then
        echo "Please enter key-value pairs separated by commas. When done, enter 'done'."
        read object
        echo "{ $object }"
    elif [ "$response" = "a" ]; then
        echo "Please enter key-value pairs separated by commas. When done, enter 'done'."
        read array
        echo "[ $array ]"
    else 
        echo "Invalid response"
    fi
elif [ "$answer" = "e" ]; then
    echo "Please enter the key that you would like to edit."
    read key
    echo "Would you like to change the key name or the key value? (n/v)"
    read answer2
    if [ "$answer2" = "n" ]; then
        echo "Please enter the new name of the key."
        read newname
        echo "Key name changed to $newname"
    elif [ "$answer2" = "v" ]; then
        echo "Please enter the new value of the key."
        read newvalue
        echo "Key value changed to $newvalue"
    else 
        echo "Invalid response"
    fi
else 
    echo "Invalid response"
fi
