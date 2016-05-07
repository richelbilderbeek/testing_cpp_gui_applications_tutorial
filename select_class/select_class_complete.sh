#!/bin/bash
myexe="select_class"
dialog_name="Select a class"

echo "Check if xdotool is installed"
. ../scripts/is_xdotool_present.sh
if [ $(is_xdotool_present) -eq 0 ]
then
  echo "ERROR: xdotool not installed, type 'sudo apt-get install xdotool' to install it"
  exit 1
fi

echo "Check if wmctrl is installed"
. ../scripts/is_wmctrl_present.sh
if [ $(is_wmctrl_present) -eq 0 ]
then
  echo "ERROR: wmctrl not installed, type 'sudo apt-get install wmctrl' to install it"
  exit 1
fi

echo "Check if executable is present"
if [ ! -e $myexe ]
then
  echo "Executable '"$myexe"' not found, run 'qmake' and 'make' in this folder to create it"
  exit 1
fi

echo "Starting the application"
./$myexe &
sleep 1

echo "Check if the dialog can be found"
. ../scripts/get_dialog_id.sh
id=`get_dialog_id $dialog_name`
if [ ! $id ] 
then 
  echo "Error: should detect window with name"$dialog_name
  exit 1
fi

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
