#!/bin/bash

. close_first_dialog_with_name.sh
. get_height_of_first_dialog_with_name.sh

window_name="(Untitled)"

leafpad &
sleep 1
dialog_height=`get_height_of_first_dialog_with_name $window_name`

if [ -z $dialog_height  ] 
then 
  echo "Error: could not find window with name "$window_name
  exit 1
else
  echo "OK: found a height of "$dialog_height" of dialog with name '"$window_name"'"
  close_first_dialog_with_name $window_name > /dev/null
fi
