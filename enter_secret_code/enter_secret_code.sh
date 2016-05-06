#!/bin/bash
myexe="enter_secret_code"
dialog_name="Enter secret code"

echo "Starting the application"
./$myexe &
sleep 1

echo "Check if the dialog can be found"
. ../scripts/get_dialog_id.sh
id=`get_dialog_id $dialog_name`

echo "Set the value 1111 to test"
xdotool windowactivate $id key Delete key Delete key Delete key Delete type 1111

echo "Click the OK button fails"
xdotool windowactivate $id sleep 0.1 key Tab sleep 0.1 key Return
if [ ! `get_dialog_id $dialog_name` ] 
then 
  echo "Error: should not be able to close dialog with incorrect code"
  exit 1
fi

echo "Set the value 4242 to test"
xdotool windowactivate $id key BackSpace key BackSpace key BackSpace key BackSpace type 4242 sleep 0.1 key alt-o

echo "Click the OK button"
xdotool windowactivate $id sleep 0.1 key Tab sleep 0.1 key Return
if [ `get_dialog_id $dialog_name` ] 
then 
  echo "Error: should not have the dialog open anymore"
  exit 1
fi
