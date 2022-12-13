# file: shell.nix

{
  shellHook = ''
  # Prompt user with question to-do
  read -p "What do you need to do? " todo
  # Create a new event in Calendar app
  osascript -e "tell application \"Calendar\" to make new event with properties {summary:\"$todo\"}"

  # Print user input into a new file with a date
  echo "$todo" >> "$(date +%Y%m%d).txt"
  '';

  shellHook = ''
  # Prompt user with question completed
  read -p "What have you completed? " completed
  # Create a new event in Calendar app
  osascript -e "tell application \"Calendar\" to make new event with properties {summary:\"$completed\"}"

  # Print user input into a new file with a date
  echo "$completed" >> "$(date +%Y%m%d).txt"
  '';

  shellHook = ''
  # Combine and move both files to a local path with date -r as the name
  mv *.txt "$(date -r)".txt
'';


}
