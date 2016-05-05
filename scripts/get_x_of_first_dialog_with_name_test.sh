#!/bin/bash

. close_first_dialog_with_name.sh
. get_x_of_first_dialog_with_name.sh

window_name="(Untitled)"

leafpad &
sleep 1
dialog_x=`get_x_of_first_dialog_with_name $window_name`

if [ -z $dialog_x  ] 
then 
  echo "Error: could not find window with name "$window_name
  exit 1
else
  echo "OK: found an x of "$dialog_x" of dialog with name '"$window_name"'"
  close_first_dialog_with_name $window_name > /dev/null
fi
