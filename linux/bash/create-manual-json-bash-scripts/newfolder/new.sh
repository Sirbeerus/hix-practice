#!/bin/bash

echo "Are you making a new JSON file or editing a JSON file? (n/e)"
read response

if [ "$response" = "n" ]; then
  echo "What is the filename?"
  read filename
  filename="$filename.json"
  echo "Are you making a JSON object or json array? (o/a)"
  read response2
  if [ "$response2" = "o" ]; then
    echo "Enter your key-value pairs one by one. Enter 'done' when finished."
    echo "Key:"
    read keyName
    while [ "$keyName" != "done" ]
    do
      echo "Value:"
      read value
      if [ "$value" != "done" ]; then
        echo "$keyName: $value," >> "$filename"
        echo "Key:"
        read keyName
      fi
    done
    echo "{" >> "$filename"
    cat "$filename" >> temp.json
    echo "}" >> temp.json
    mv temp.json $filename
    echo "File $filename successfully created."
  elif [ "$response2" = "a" ]; then
    echo "Enter your key-value pairs one by one. Enter 'done' when finished."
    echo "Key:"
    read keyName
    while [ "$keyName" != "done" ]
    do
      echo "Value:"
      read value
      if [ "$value" != "done" ]; then
        echo "$keyName: $value," >> "$filename"
        echo "Key:"
        read keyName
      fi
    done
    echo "[" >> "$filename"
    cat "$filename" >> temp.json
    echo "]" >> temp.json
    mv temp.json $filename
    echo "File $filename successfully created."
  else
    echo "Invalid response."
  fi
elif [ "$response" = "e" ]; then
  echo "What is the filename?"
  read filename
  filename="$filename.json"
  echo "What key do you want to edit?"
  read keyName
  echo "Do you want to change the key name or key value? (n/v)"
  read edit
  if [ "$edit" = "n" ]; then
    echo "What is the new key name?"
    read newName
    sed -i "s/$keyName/$newName/g" $filename
    echo "Key name successfully changed."
  elif [ "$edit" = "v" ]; then
    echo "What is the new key value?"
    read newValue
    sed -i "s/$keyName:.*/$keyName: $newValue/g" $filename
    echo "Key value successfully changed."
  else
    echo "Invalid response."
  fi
else
  echo "Invalid response."
fi
