#!/bin/bash

#Prompt the user with the question
echo "What are you to-do?"
read to_do

#Insert user input into a new event in Calendar app
osascript -e "tell application \"Calendar\" to make new event with properties {summary:\"$to_do\"}"

#Print user input into a new file with a date to be saved on a local path
date=$(date +%F)
echo "$to_do" > ~/Documents/programming/calendar/$date.txt

#Prompt the user with the question
echo "What did you complete?"
read completed

#Insert user input into a new event in Calendar app
osascript -e "tell application \"Calendar\" to make new event with properties {summary:\"$completed\"}"

#Print user input into a new file with a date to be saved on a local path
date=$(date +%F)
echo "$completed" > ~/Documents/programming/calendar/$date.txt

#Combines and moves both files to a directory on "local path" that uses the label date +%F
mv /path/to/local/directory/*.txt ~/Documents/programming/calendar/$date.txt
