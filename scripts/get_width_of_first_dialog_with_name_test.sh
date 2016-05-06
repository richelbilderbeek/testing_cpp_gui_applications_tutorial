#!/bin/bash

. close_first_dialog_with_name.sh
. get_width_of_first_dialog_with_name.sh

window_name="(Untitled)"

leafpad &
sleep 1
dialog_width=`get_width_of_first_dialog_with_name $window_name`

if [ -z $dialog_width  ] 
then 
  echo "Error: could not find window with name "$window_name
  exit 1
else
  echo "OK: found a width of "$dialog_width" of dialog with name '"$window_name"'"
  close_first_dialog_with_name $window_name > /dev/null
fi
