#!/bin/bash
# ===================================================
# restore-emmc.sh
# Write a new image to the eMMC chip.
#
# DO NOT RUN THIS SCRIPT BEFORE READING AND UNDERSTANDING
# THE README.md.
# ===================================================

drive=$(cat EMMC-DRIVE)
filename=''
bs=16M

function warning() {
  echo "======================================================"
  echo "You are about to $1 the WHOLE emmc card at ${drive}."
  echo "======================================================"
  echo "NOTE: did you wipe the disk or partition first?"
  echo ""
  read -p "Continue? (y/n): " continue
  if [ "$continue" != "y" ]
  then
    echo "Aborting"
    exit
  fi
}

function getfilename() {
  echo "======================================================"
  echo "Note: assumes current directory."
  echo $1
  read -p "Filename: " filename
  if [ -f $filename ]
  then
    isarchive=$(echo $filename|grep -c ".*xz$")
    if [ "$isarchive" = "1" ]
    then
      echo "Error: the image file is still archived. Aborting."
      exit 1
    fi
  else
    echo "The filename does not exist. Aborting."
    exit 1
  fi
}

function check() {
  if [ "$1" = "" ]
  then
    echo "Invalid parameters."
    exit 1
  fi
}


# Adapted from:
# https://stackoverflow.com/a/18558871
beginswith() { case $2 in "$1"*) true;; *) false;; esac; }

if beginswith /dev/ "$drive"
then
  warning RESTORE
  getfilename "Enter the filename to load the image from"

  check $drive
  check $filename

  echo "Beginning copy ..."
  sudo dd if=${filename} bs=${bs} of=${drive}
else
  echo "=============================================================================="
  echo "=============================================================================="
  echo ""
  echo "Please edit EMMC-DRIVE in order to activate this script. See Readme.md."
  echo ""
  echo "=============================================================================="
  echo "=============================================================================="
fi
