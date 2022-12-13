#!/bin/bash

echo "Creating a new file (n) or editing (e) an existing file?"
read -p "n/e: " response

case $response in
        [Nn]* )
                echo "Enter file name: "
                read -p "$filename"
		filename="$filename.json"

		echo "{" >> $filename

		echo "Enter key name: "
		read -p "$keyname"
		echo "\"$keyname\": " >> $filename

		echo "Creating a value (v), object (o) or array (a)? done when done"
		read -p "v/o/a/done: " response
				
		while [ $response != "done" ]
		do
			case $response in
				[Vv]* )
					echo "Enter value: "
					read -p "$value"
					echo "$value," >> $filename

					echo "Creating a value (v), object (o) or array (a)? done when done"
					read -p "v/o/a/done: " response
					;;
				[Oo]* )
					echo "{" >> $filename
					echo "Enter key value pairs: "
					read -p "$keyvalue"
					echo "\"$keyvalue\", " >> $filename
					echo "}," >> $filename

					echo "Creating a value (v), object (o) or array (a)? done when done"
					read -p "v/o/a/done: " response
					;;
				[Aa]* )
					echo "[" >> $filename
					echo "Enter list: "
					read -p "$list"
					echo "$list," >> $filename
					echo "]," >> $filename

					echo "Creating a value (v), object (o) or array (a)? done when done"
					read -p "v/o/a/done: " response
					;;
				*)
					echo "Creating a value (v), object (o) or array (a)? done when done"
					read -p "v/o/a/done: " response
					;;
			esac
		done
		echo "}" >> $filename
		echo "$filename created."
                ;;
        [Ee]* )
                echo "Enter file name: "
                read -p "$filename"
		if [ -f "$filename" ]; then
			echo "Editing existing key value (ekv) or removing existing key value (rkv)?"
			read -p "ekv/rkv: " response
			
			case $response in
				[Ee]* )
					echo "Enter key name: "
					read -p "$keyname"
					echo "Creating a value (v), object (o) or array (a)?"
					read -p "v/o/a: " response
					while [ $response != "done" ]
					do
						case $response in
							[Vv]* )
								echo "Enter value:"
								read -p "$value"
								sed -i "s/\($keyname\s*:\s*\).*/\1$value/" $filename
								echo "Editing another key value (ekv) or done when done?"
								read -p "ekv/done: " response
								;;
							[Oo]* )
								echo "{" >> $filename
								echo "Enter key value pairs: "
								read -p "$keyvalue"
								echo "\"$keyvalue\", " >> $filename
								echo "}," >> $filename
								sed -i "s/\($keyname\s*:\s*\).*/\1$keyvalue/" $filename
								echo "Editing another key value (ekv) or done when done?"
								read -p "ekv/done: " response
								;;
							[Aa]* )
								echo "[" >> $filename
								echo "Enter list: "
								read -p "$list"
								echo "$list," >> $filename
								echo "]," >> $filename
								sed -i "s/\($keyname\s*:\s*\).*/\1$list/" $filename
								echo "Editing another key value (ekv) or done when done?"
								read -p "ekv/done: " response
								;;
							*)
								echo "Editing another key value (ekv) or done when done?"
								read -p "ekv/done: " response
								;;
						esac
					done
					echo "Contents of $filename updated."
					;;
				[Rr]* )
					echo "Enter key name: "
					read -p "$keyname"
					sed -i "/\s*$keyname\s*:/d" $filename
					echo "Removing another key value (rkv) or done when done?"
					read -p "rkv/done: " response
					while [ $response != "done" ]
					do
						echo "Enter key name: "
						read -p "$keyname"
						sed -i "/\s*$keyname\s*:/d" $filename
						echo "Removing another key value (rkv) or done when done?"
						read -p "rkv/done: " response
					done
					echo "Contents of $filename updated."
					;;
				*)
					echo "Editing existing key value (ekv) or removing existing key value (rkv)?"
					read -p "ekv/rkv: " response
					;;
			esac
		else
			echo "$filename not found."
		fi
                ;;
        *)
                echo "Creating a new file (n) or editing (e) an existing file?"
		read -p "n/e: " response
		;;
esac
