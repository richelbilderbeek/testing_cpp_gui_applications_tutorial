#!/bin/bash

function is_dialog_present
{
  id=`wmctrl -l | egrep "$@" | cut -f 1 -d ' '`
  if [ -z $id ] 
  then
    echo 0
  else
    echo 1
  fi
}
