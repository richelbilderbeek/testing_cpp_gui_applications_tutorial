#!/bin/bash

id=`wmctrl -l | egrep "$@" | cut -f 1 -d ' '`
if [ $id ] 
then
  echo "yes, ID is "$id
else
  echo "no"
fi
