#!/bin/bash
# Inserts "Hello World!" into the OpenAI Playground website
open -a "Google Chrome" "https://beta.openai.com/playground"

# wait for the page to load
sleep 3

# insert text using the keyboard simulation
xdotool type "Hello World!"
