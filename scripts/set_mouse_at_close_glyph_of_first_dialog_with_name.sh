#!/bin/bash

# Set the mouse at the closing glyph (e.g. the cross at the top-right)
# of the first window with the arguments as its window title
# Returns an error code, of which 0 denotes OK, 1 denotes fail

. ../scripts/get_dialog_id.sh
. ../scripts/get_x_of_first_dialog_with_name.sh
. ../scripts/get_y_of_first_dialog_with_name.sh
. ../scripts/get_width_of_first_dialog_with_name.sh
. ../scripts/get_height_of_first_dialog_with_name.sh

function set_mouse_at_close_glyph_of_first_dialog_with_name
{
  id=`get_dialog_id "$@"`
  if [ -z $id ] 
  then
    return 1
  fi

  # Get the geometry
  x=`get_x_of_first_dialog_with_name $dialog_name`
  y=`get_y_of_first_dialog_with_name $dialog_name`
  w=`get_width_of_first_dialog_with_name $dialog_name`

  # Calculating the position of where to put the mouse, to be able to click on the cross
  mouse_x=$(($x+$w-16))
  mouse_y=$(($y-32))

  xdotool windowactivate $id sleep 0.1 mousemove $mouse_x $mouse_y
  return 0
}
