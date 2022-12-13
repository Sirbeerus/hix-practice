#!/bin/bash
# Opens the OpenAI Playground website in the default web browser
open -a "Google Chrome" "https://beta.openai.com/playground"

wait

# click inside html body
xdotool click 1

# insert text using the keyboard simulation
xdotool type "Hello World!"



# Print the variable to the terminal
# echo $MY_VARIABLE

# Insert the variable into the web page
#sed -i "s/VARIABLE_PLACEHOLDER/$MY_VARIABLE/g" "https://beta.openai.com/playground"
