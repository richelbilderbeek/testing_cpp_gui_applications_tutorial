#!/bin/bash
myexe="../build-minimal_project-Desktop-Debug/minimal_project"
dialog_name="Dialog"

# Check if xdotool is installed
. ../scripts/is_xdotool_present.sh
if [ $(is_xdotool_present) -eq 0 ]
then
  echo "ERROR: xdotool not installed, type 'sudo apt-get install xdotool' to install it"
  exit 1
fi


# Check if wmctrl is installed
. ../scripts/is_wmctrl_present.sh
if [ $(is_wmctrl_present) -eq 0 ]
then
  echo "ERROR: wmctrl not installed, type 'sudo apt-get install wmctrl' to install it"
  exit 1
fi

# Check if executable is present
if [ ! -e $myexe ]
then
  echo "Executable '"$myexe"' not found"
  exit 1
fi

# Start the testing
echo "Starting the application"
$myexe &
sleep 1

# Test if the dialog is found
. ../scripts/get_dialog_id.sh
id=`get_dialog_id $dialog_name`
if [ $id ] 
then 
  echo "OK: detected window with id "$id
else
  echo "Error: should detect window with name"$dialog_name
  exit 1
fi

# Close the dialog using ALT-F4
. ../scripts/close_first_dialog_with_name.sh
error=`close_first_dialog_with_name $dialog_name`
if [ ! $error -eq 0 ]
then 
  echo "Error: could not close dialog with name "$dialog_name
  exit 1
fi

echo "Starting the application again"
$myexe &
sleep 1

# Obtaining the window geometry
echo `xdotool getwindowgeometry $id`

# Extracting the dimensions
. ../scripts/get_x_of_first_dialog_with_name.sh
. ../scripts/get_y_of_first_dialog_with_name.sh
. ../scripts/get_width_of_first_dialog_with_name.sh
. ../scripts/get_height_of_first_dialog_with_name.sh
x=`get_x_of_first_dialog_with_name $dialog_name`
y=`get_y_of_first_dialog_with_name $dialog_name`
w=`get_width_of_first_dialog_with_name $dialog_name`
h=`get_height_of_first_dialog_with_name $dialog_name`
echo "x: "$x
echo "y: "$y
echo "width:"$w
echo "height: "$h

# Calculating the position of where to put the mouse, to be able to click on the cross
mouse_x=$(($x+$w-16))
mouse_y=$(($y-32))
echo "where to click, x coordinat: "$mouse_x
echo "where to click, y coordinat: "$mouse_y

echo "Closing the dialog using a mouse click"
xdotool windowactivate $id sleep 0.1 mousemove $mouse_x $mouse_y click 1

exit 0
