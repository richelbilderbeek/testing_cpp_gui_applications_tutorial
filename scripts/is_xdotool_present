#!/bin/bash

# Checks if xdotool is installed. Returns 1 if yes, 0 if not.

function is_xdotool_present
{
  command -v xdotool >/dev/null 2>&1 || { echo 0; exit 0; }
  echo 1
}
