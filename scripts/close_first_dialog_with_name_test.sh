#!/bin/bash
. close_first_dialog_with_name.sh

must_be_one=`close_first_dialog_with_name "absent dialog"`
if [ $must_be_one -eq 0 ]
then 
  echo "Error: should not be able to close an absent dialog"
  exit 1
fi

echo "OK: could not close absent window"

leafpad &
sleep 1
must_be_zero=`close_first_dialog_with_name "(Untitled)"`

if [ $must_be_zero -eq 0 ] 
then 
  echo "OK: closed leafpad window"
else
  echo "Error: could not close leafpad window"
  exit 1
fi
