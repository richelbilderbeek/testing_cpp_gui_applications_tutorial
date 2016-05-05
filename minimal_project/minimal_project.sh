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
  echo "Error: should detect empty leafpad window"
  exit 1
fi

# Obtaining the location of the cross
echo `xdotool getwindowgeometry $id`
exit 0

x=`xdotool getwindowgeometry $(wmctrl -l | egrep "Dialog" | cut -f 1 -d ' ') | egrep "Position" | cut -d ':' -f 2 | cut -d '(' -f 1 | cut -d ',' -f 1`
y=`xdotool getwindowgeometry $(wmctrl -l | egrep "Dialog" | cut -f 1 -d ' ') | egrep "Position" | cut -d ':' -f 2 | cut -d '(' -f 1 | cut -d ',' -f 2`
w=`xdotool getwindowgeometry $(wmctrl -l | egrep "Dialog" | cut -f 1 -d ' ') | egrep "Geometry" | cut -d ':' -f 2 | cut -d 'x' -f 1`
h=`xdotool getwindowgeometry $(wmctrl -l | egrep "Dialog" | cut -f 1 -d ' ') | egrep "Geometry" | cut -d ':' -f 2 | cut -d 'x' -f 2`

echo "x:"$x
echo "y: "$y
echo "width:"$w
echo "height: "$h
mouse_x=$(($x+$w-16))
mouse_y=$(($y-32))
echo "where to click, x coordinat: "$mouse_x
echo "where to click, y coordinat: "$mouse_y

echo "Closing the dialog using a mouse click"
xdotool windowactivate $(wmctrl -l | egrep "Dialog" | cut -f 1 -d ' ') sleep 0.1 mousemove $mouse_x $mouse_y click 1

echo "Starting the application"
$myexe &
sleep 1

echo "Closing the dialog using Alt-F4"
xdotool windowactivate $(wmctrl -l | egrep "Dialog" | cut -f 1 -d ' ') sleep 0.1 key alt+F4



