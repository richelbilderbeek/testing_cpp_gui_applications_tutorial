#!/bin/bash
. is_wmctrl_present.sh

is_present=`is_wmctrl_present`

if [ $is_present -eq 1 ] 
then
  echo "wmctrl is present"
else
  echo "wmctrl is absent, type 'sudo apt-get install wmctrl' to install it"
fi