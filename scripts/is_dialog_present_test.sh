#!/bin/bash
. is_dialog_present.sh

must_be_zero=`is_dialog_present "absent dialog"`
if [ $must_be_zero -eq 1 ] 
then 
  echo "Error: should not detect an absent dialog"
  exit 1
fi

leafpad &
sleep 1
must_be_one=`is_dialog_present "(Untitled)"`

if [ $must_be_one -eq 0 ] 
then 
  echo "Error: should detect empty leafpad window"
  exit 1
fi
