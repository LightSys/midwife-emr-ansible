#!/bin/bash
# ===================================================
# backup-emmc.sh
# Backup the whole eMMC card at the drive specified
# below with the drive variable.
#
# DO NOT RUN THIS SCRIPT BEFORE READING AND UNDERSTANDING
# THE README.md.
# ===================================================

drive=$(cat EMMC-DRIVE)
filename=''
bs=16M

function warning() {
  echo "======================================================"
  echo "You are about to $1 the WHOLE emmc card from ${drive}."
  echo "======================================================"
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
  warning BACKUP
  getfilename "Enter the filename to save the image to."

  check $drive
  check $filename

  echo "Beginning copy ..."
  sudo dd if=${drive} bs=${bs} of=${filename}
else
  echo "=============================================================================="
  echo "=============================================================================="
  echo ""
  echo "Please edit EMMC-DRIVE in order to activate this script. See Readme.md."
  echo ""
  echo "=============================================================================="
  echo "=============================================================================="
fi

