#!/bin/bash
. is_xdotool_present.sh

is_present=`is_xdotool_present`

if [ $is_present -eq 1 ] 
then
  echo "xdotool is present"
else
  echo "xdotool is absent, type 'sudo apt-get install xdotool' to install it"
fi