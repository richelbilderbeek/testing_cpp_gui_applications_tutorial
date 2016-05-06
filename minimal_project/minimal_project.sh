#!/bin/bash
myexe="minimal_project"
dialog_name="Dialog"


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


echo "Close the dialog using ALT-F4"
. ../scripts/close_first_dialog_with_name.sh
error=`close_first_dialog_with_name $dialog_name`
if [ ! $error -eq 0 ]
then 
  echo "Error: could not close dialog with name "$dialog_name
  exit 1
fi



echo "Starting the application again"
./$myexe &
sleep 1


echo "Close the dialog by setting the mouse at the closing glyph and clicking"
. ../scripts/set_mouse_at_close_glyph_of_first_dialog_with_name.sh
set_mouse_at_close_glyph_of_first_dialog_with_name $dialog_name
sleep 1 # For suspense
# Set the mouse at the closing glyph again (in case the user moved the mouse)
set_mouse_at_close_glyph_of_first_dialog_with_name $dialog_name
xdotool click 1