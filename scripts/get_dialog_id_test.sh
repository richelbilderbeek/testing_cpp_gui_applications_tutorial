#!/bin/bash
. get_dialog_id.sh

must_be_nothing=`get_dialog_id "absent dialog"`
if [ $must_be_nothing ] 
then 
  echo "Error: should not detect an absent dialog"
  exit 1
fi

leafpad &
sleep 1
must_be_something=`get_dialog_id "(Untitled)"`

if [ $must_be_something ] 
then 
  echo "OK: detected leafpad window with id "$must_be_something
else
  echo "Error: should detect empty leafpad window"
  exit 1
fi
