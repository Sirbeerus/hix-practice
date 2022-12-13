#!/bin/bash 

echo "Are you creating a new file(n) or editing an existing file (e)?"
read answer

if [ "$answer" == "n" ]; then
    echo "What is the file name?"
    read filename
    echo "{" >> $filename.json
    while true; do
        echo "What is the key name?"
        read keyname
        echo "What is the value (v), object (o) or array (a)?"
        read keyvalue
        if [ "$keyvalue" == "v" ]; then
            echo "What is the value?"
            read value
            echo "\"$keyname\" : \"$value\"," >> $filename.json
        elif [ "$keyvalue" == "o" ]; then
            echo "{" >> $filename.json
            while true; do
                echo "What is the key name?"
                read keyname
                echo "What is the value?"
                read value
                echo "\"$keyname\" : \"$value\"," >> $filename.json
                echo "Do you want to make another value (v), object (o) or array (a)?"
                read keyvalue
                if [ "$keyvalue" != "v" ] && [ "$keyvalue" != "o" ] && [ "$keyvalue" != "a" ]; then
                    break
                fi
            done
            echo "}," >> $filename.json
        elif [ "$keyvalue" == "a" ]; then
            echo "[" >> $filename.json
            while true; do
                echo "What is the value?"
                read value
                echo "\"$value\"," >> $filename.json
                echo "Do you want to make another value (v), object (o) or array (a)?"
                read keyvalue
                if [ "$keyvalue" != "v" ] && [ "$keyvalue" != "o" ] && [ "$keyvalue" != "a" ]; then
                    break
                fi
            done
            echo "]," >> $filename.json
        else
            break
        fi
    done
    echo "}" >> $filename.json
    echo "Your json file:"
    cat $filename.json

elif [ "$answer" == "e" ]; then
    echo "What is the file name?"
    read filename
    echo "Your json file:"
    cat $filename.json
    while true; do
        echo "What is the key name?"
        read keyname
        echo "What is the value (v), object (o) or array (a)?"
        read keyvalue
        if [ "$keyvalue" == "v" ]; then
            echo "What is the value?"
            read value
            echo "\"$keyname\" : \"$value\"," >> $filename.json
        elif [ "$keyvalue" == "o" ]; then
            echo "{" >> $filename.json
            while true; do
                echo "What is the key name?"
                read keyname
                echo "What is the value?"
                read value
                echo "\"$keyname\" : \"$value\"," >> $filename.json
                echo "Do you want to make another value (v), object (o) or array (a)?"
                read keyvalue
                if [ "$keyvalue" != "v" ] && [ "$keyvalue" != "o" ] && [ "$keyvalue" != "a" ]; then
                    break
                fi
            done
            echo "}," >> $filename.json
        elif [ "$keyvalue" == "a" ]; then
            echo "[" >> $filename.json
            while true; do
                echo "What is the value?"
                read value
                echo "\"$value\"," >> $filename.json
                echo "Do you want to make another value (v), object (o) or array (a)?"
                read keyvalue
                if [ "$keyvalue" != "v" ] && [ "$keyvalue" != "o" ] && [ "$keyvalue" != "a" ]; then
                    break
                fi
            done
            echo "]," >> $filename.json
        else
            break
        fi
    done
    echo "Your json file:"
    cat $filename.json
fi
