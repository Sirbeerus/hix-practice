echo "are you making a new JSON file or editing an existing one? (new/edit): "
read action

if [ "$action" == "new" ]; then
 echo "Please enter filename for the new JSON file: "
 read filename
 if [[ "$filename" != *.json ]]; then
  filename="$filename.json"
 fi
 echo "Are you making a JSON object or JSON array? (object/array): "
 read type

 if [ "$type" == "object" ]; then
  echo "Start adding key-value pairs, when done type 'done': "
  read key_value

  while :
  do
   if [ "$key_value" == "done" ]; then
    break
   fi
   echo "Enter Key: "
   read key
   echo "Enter Value: "
   read value
   echo "$key: $value," >> $filename
   echo "Enter next key-value pair or type 'done': "
   read key_value
  done
  echo "}]" >> $filename
 elif [ "$type" == "array" ]; then
  echo "Start adding objects, when done type 'done': "
  read object

  while :
  do
   if [ "$object" == "done" ]; then
    break
   fi
   echo "Enter Object: "
   read object
   echo "$object," >> $filename
   echo "Enter next object or type 'done': "
   read object
  done
  echo "]}" >> $filename
 fi

elif [ "$action" == "edit" ]; then
 echo "Please enter filename for the existing JSON file: "
 read filename
 echo "Please enter key to be edited: "
 read key
 echo "Do you want to change the key name or the key value? (name/value): "
 read change
 if [ "$change" == "name" ]; then
  echo "Please enter new key name: "
  read new_key
  sed -i -e "s/$key/$new_key/g" $filename
 elif [ "$change" == "value" ]; then
  echo "Please enter new key value: "
  read new_value
  sed -i -e "/$key/ s/\(.*\):.*/\1: $new_value/g" $filename
 fi
fi
