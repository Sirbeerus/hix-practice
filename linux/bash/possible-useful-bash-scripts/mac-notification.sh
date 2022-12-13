#!/bin/bash

# Send "Hello World" to Mac OS X notification
# osascript -e 'display notification "Hello World" with title "Message"'

# Send "Hello World" to Mac OS X notification
osascript -e 'display notification "Hello World" with title "Message"'


# Create Notifications folder on Desktop
mkdir ~/Desktop/Notifications

# Copy notification to Notifications folder
osascript -e 'copy display notification "Hello World" with title "Message" to (path to desktop folder "Notifications")'
