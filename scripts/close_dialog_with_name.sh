#!/bin/bash

# Close the *first* window with the arguments
# as its window title
# Returns an error code, 0 if everything went OK

. ../scripts/get_dialog_id.sh

function close_dialog_with_name
{
  id=`get_dialog_id "$@"`
  if [ ! $id ] 
  then
    # echo "Error: should detect window with name '"$@"'"
    echo 1
  else
    xdotool windowactivate $id sleep 0.1 key alt+F4
    echo 0
  fi
}
