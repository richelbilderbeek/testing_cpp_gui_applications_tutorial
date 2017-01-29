#!/bin/bash

# Checks if there is at least one dialog with the arguments of the function
# as its window title

function is_dialog_present
{
  id=`wmctrl -l | egrep "$@" | head -n 1 | cut -f 1 -d ' '`
  if [ -z $id ] 
  then
    echo 0
  else
    echo 1
  fi
}
