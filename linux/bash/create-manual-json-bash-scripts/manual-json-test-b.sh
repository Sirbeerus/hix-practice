#!/bin/bash

echo "Are you making a new JSON file or editing an existing one?"
read response

if [ "$response" == "making a new JSON file" ]
then
    echo "Enter filename:"
    read filename
    echo "$filename.json"
    echo "Are you making a JSON object or JSON array?"
    read objectOrArray
    if [ "$objectOrArray" == "JSON object" ]
    then
        echo "JSON objects are wrapped in curly braces. Inside the object, we can list any number of key-value pairs, separated by commas:"
        echo "When done making key value pairs press enter."
    elif [ "$objectOrArray" == "JSON array" ]
    then
        echo "JSON arrays are wrapped in square brackets. Inside an array, we can declare any number of objects, separated by commas:"
        echo "When done making key value pairs inside list press enter."
    fi
elif [ "$response" == "editing an existing JSON file" ]
then
    echo "What key are you looking for?"
    read keyName
    echo "Do you want to change the key name or the key value?"
    read changeType
    if [ "$changeType" == "key name" ]
    then
        echo "Enter the new key name:"
        read newName
    elif [ "$changeType" == "key value" ]
    then
        echo "Enter the new key value:"
        read newValue
    fi
fi
