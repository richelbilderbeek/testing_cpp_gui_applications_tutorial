#!/bin/bash

function is_dialog_present
{
  id=`wmctrl -l | egrep "$@" | cut -f 1 -d ' '`
  if [ $id ] 
  then
    echo 1
  else
    echo 0
  fi
}
