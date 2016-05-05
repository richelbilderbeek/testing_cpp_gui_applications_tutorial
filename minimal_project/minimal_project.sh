#!/bin/bash

myexe="../build-minimal_project-Desktop-Debug/minimal_project"
if [ -e /$myexe ]
then
  echo "Executable '"$myexe"' not found"
  exit
fi

echo "Starting the application"
$myexe &
sleep 1


# Obtaining the location of the cross
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



