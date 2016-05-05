#!/bin/bash

function get_dialog_id
{
  echo `wmctrl -l | egrep "$@" | cut -f 1 -d ' '`
}
