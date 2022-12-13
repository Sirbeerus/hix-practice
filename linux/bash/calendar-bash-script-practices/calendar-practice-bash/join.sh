#!/bin/bash

echo "Please enter the name of the event: "
read eventname

echo "Please enter the date of the event: "
read eventdate

echo "Please enter the time of the event: "
read eventtime

echo "Please enter the description of the event: "
read eventdesc

# Insert the event into the New Event calendar
osascript -e "tell application \"Calendar\"
    set theCal to calendar \"New Event\"
    make new event at theCal with properties {summary:\"$eventname\", start date:date \"$eventdate\", start time:time \"$eventtime\", description:\"$eventdesc\"}
end tell"
