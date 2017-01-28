#!/bin/bash

# Get the width of the first window with the arguments
# as its window title
# Shows nothing if the window cannot be found

. ../scripts/get_dialog_id.sh

function get_width_of_first_dialog_with_name
{
  id=`get_dialog_id "$@"`
  if [ $id ] 
  then
    echo `xdotool getwindowgeometry $id | egrep "Geometry" | cut -d ':' -f 2 | cut -d 'x' -f 1`
  fi
}
