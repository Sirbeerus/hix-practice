#!/bin/bash

clear

# Print calendar
echo "Today's date is:"
cal

# Get user input
echo -n "What would you like to do? (make/complete/remove): "
read action

# Handle the user input
case $action in
  make)
    echo "Let's make a to-do list"
    # Create an empty array
    todo_list=()
    # Loop over user input until "done" is entered
    while true; do
      # Ask for user input
      echo -n "Please enter to-do item or type 'done': "
      read item
      # Check if user is done
      if [ $item == "done" ]; then
        break
      fi
      # Append user input to to-do list
      todo_list+=($item)
    done
    # Print the to-do list
    echo "Your to-do list is:"
    for item in ${todo_list[@]}; do
      echo "* $item"
    done
    # Write to-do list to file
    echo "Writing to-do list to file..."
    date_string=`date -r`
    echo "$date_string" > todo.txt
    for item in ${todo_list[@]}; do
      echo "* $item" >> todo.txt
    done
    echo "Done!"
    ;;
  complete)
    echo "Let's complete some items from the to-do list"
    # Check if to-do list file exists
    if [ ! -f todo.txt ]; then
      echo "Error: to-do list file not found!"
      exit 1
    fi
    # Read to-do list from file
    echo "Reading to-do list from file..."
    todo_list=()
    while read -r line
    do
      todo_list+=( "$line" )
    done < todo.txt
    # Print the to-do list
    echo "Your to-do list is:"
    for item in ${todo_list[@]}; do
      echo "* $item"
    done
    # Ask user to enter items to complete
    while true; do
      # Ask for user input
      echo -n "Please enter item to complete or type 'done': "
      read item
      # Check if user is done
      if [ $item == "done" ]; then
        break
      fi
      # Find the item in the to-do list
      found=false
      for i in ${!todo_list[@]}; do
        if [ ${todo_list[i]} == "* $item" ]; then
          # Mark the item as completed
          todo_list[i]="* [COMPLETED] $item"
          found=true
          break
        fi
      done
      # Check if item was found
      if [ $found == false ]; then
        echo "Error: item not found!"
      fi
    done
    # Print the to-do list
    echo "Your to-do list is now:"
    for item in ${todo_list[@]}; do
      echo "$item"
    done
    # Write to-do list to file
    echo "Writing to-do list to file..."
    date_string=`date -r`
    echo "$date_string" > todo.txt
    for item in ${todo_list[@]}; do
      echo "$item" >> todo.txt
    done
    echo "Done!"
    ;;
  remove)
    echo "Let's remove some items from the to-do list"
    # Check if to-do list file exists
    if [ ! -f todo.txt ]; then
      echo "Error: to-do list file not found!"
      exit 1
    fi
    # Read to-do list from file
    echo "Reading to-do list from file..."
    todo_list=()
    while read -r line
    do
      todo_list+=( "$line" )
    done < todo.txt
    # Print the to-do list
    echo "Your to-do list is:"
    for item in ${todo_list[@]}; do
      echo "* $item"
    done
    # Ask user to enter items to remove
    while true; do
      # Ask for user input
      echo -n "Please enter item to remove or type 'done': "
      read item
      # Check if user is done
      if [ $item == "done" ]; then
        break
      fi
      # Find the item in the to-do list
      found=false
      for i in ${!todo_list[@]}; do
        if [ ${todo_list[i]} == "* $item" ]; then
          # Remove the item from the to-do list
          unset todo_list[i]
          found=true
          break
        fi
      done
      # Check if item was found
      if [ $found == false ]; then
        echo "Error: item not found!"
      fi
    done
    # Print the to-do list
    echo "Your to-do list is now:"
    for item in ${todo_list[@]}; do
      echo "$item"
    done
    # Write to-do list to file
    echo "Writing to-do list to file..."
    date_string=`date -r`
    echo "$date_string" > todo.txt
    for item in ${todo_list[@]}; do
      echo "$item" >> todo.txt
    done
    echo "Done!"
    ;;
  *)
    echo "Error: invalid action!"
    exit 1
    ;;
esac
