#!/bin/bash
# Gives an error if the dialog is not detected,
# is silent otherwise

# Load function
. is_dialog_present.sh

# Test
must_be_one=`is_dialog_present "$@"`
if [ $must_be_one -eq 0 ] 
then 
  echo "Error: should detect window with title: "$@
  exit 1
fi

