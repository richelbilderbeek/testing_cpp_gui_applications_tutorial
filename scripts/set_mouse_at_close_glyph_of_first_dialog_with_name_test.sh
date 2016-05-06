#!/bin/bash

. close_first_dialog_with_name.sh
. set_mouse_at_close_glyph_of_first_dialog_with_name.sh

window_name="(Untitled)"

leafpad &
sleep 1
error_code=`set_mouse_at_close_glyph_of_first_dialog_with_name $window_name`

if [ $error_code -eq 1 ] 
then 
  echo "Error: could not find window with name "$window_name
  exit 1
else
  echo "OK: mouse is set to the closing glyph of the first dialog with name '"$window_name"'"
fi
