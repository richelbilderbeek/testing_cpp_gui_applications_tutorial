#!/bin/bash

# Get the ID of the *first* window with the arguments
# as its window title

function get_dialog_id
{
  echo `wmctrl -l | egrep "$*" | head -n 1 | cut -f 1 -d ' '`
}
