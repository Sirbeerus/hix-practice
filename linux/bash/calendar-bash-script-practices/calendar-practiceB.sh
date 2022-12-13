#!/bin/bash
echo "$cal"
echo "Let's create your to-do list!"
echo
echo "Please type your list items one at a time. When you're done, type 'done'."
echo

read -p "Enter a new to-do item: " item

list=()
while [ "$item" != "done" ]; do
  list+=("$item")
  read -p "Enter a new to-do item: " item
done

echo
echo "Here is your to-do list:"
for item in "${list[@]}"; do
  echo "$item"
done

echo
echo "Do you want to complete a to-do item? (y/n)"
read answer

while [ "$answer" == "y" ]; do
  echo
  echo "Which item would you like to complete?:"
  select item in "${list[@]}"; do
    list=("${list[@]/$item}")
    break
  done
  echo
  echo "Completed item: $item"
  echo
  echo "Do you want to complete another to-do item? (y/n)"
 
