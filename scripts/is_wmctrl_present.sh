#!/bin/bash

# Adapted from http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
function is_wmctrl_present
{
  command -v wmctrl >/dev/null 2>&1 || { echo 0; exit 0; }
  echo 1
}
