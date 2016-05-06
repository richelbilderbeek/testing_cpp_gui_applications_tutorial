#!/bin/bash
myexe="minimal_project"
dialog_name="Dialog"

echo "Starting the application"
./$myexe &
sleep 1

echo "Check if the dialog can be found"
. ../scripts/get_dialog_id.sh
id=`get_dialog_id $dialog_name`

echo "Close the dialog using ALT-F4"
. ../scripts/close_first_dialog_with_name.sh
close_first_dialog_with_name $dialog_name

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