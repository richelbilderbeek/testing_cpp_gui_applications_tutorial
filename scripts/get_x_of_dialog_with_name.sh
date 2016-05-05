#!/bin/bash

# Get the x of the *first* window with the arguments
# as its window title
# Shows nothing if the window cannot be found

. ../scripts/get_dialog_id.sh

function get_x_of_dialog_with_name
{
  id=`get_dialog_id "$@"`
  if [ $id ] 
  then
    echo `xdotool getwindowgeometry $id | egrep "Position" | cut -d ':' -f 2 | cut -d '(' -f 1 | cut -d ',' -f 1`
  fi
}
