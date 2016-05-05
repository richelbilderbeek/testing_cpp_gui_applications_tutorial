#!/bin/bash
# Let the assessor create a test concept map



myexe="../build-enter_secret_code_window-Desktop-Debug/enter_secret_code_window"
if [ -e /$myexe ]
then
  echo "Executable '"$myexe"' not found"
  exit
fi

# Start application
$myexe &
sleep 1

echo "Found window at '$(xdotool search --name "Enter secret code")'"