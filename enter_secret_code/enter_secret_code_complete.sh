#!/bin/bash
myexe="enter_secret_code"
dialog_name="Enter secret code"

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
