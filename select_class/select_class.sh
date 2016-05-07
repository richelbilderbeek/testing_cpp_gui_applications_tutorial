#!/bin/bash
myexe="select_class"
dialog_name="Select a class"

echo "Starting the application"
./$myexe &
sleep 1

echo "Check if the dialog can be found"
. ../scripts/get_dialog_id.sh
id=`get_dialog_id $dialog_name`

echo "Pick mage"
xdotool windowactivate $id sleep 0.5 key alt+m sleep 0.5

echo "Find new dialog"
id_new=`get_dialog_id "You've picked: mage"`
if [ ! $id_new ] 
then 
  echo "Error: could not detect correct window"
  exit 1
fi

echo "Press OK"
xdotool windowactivate $id_new sleep 0.1 key alt+o
