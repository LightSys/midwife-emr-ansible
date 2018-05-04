#!/bin/bash
# ===================================================
# wipe-emmc.sh
# Delete all data, partitions, and everything else from
# the eMMC drive.
#
# DO NOT RUN THIS SCRIPT BEFORE READING AND UNDERSTANDING
# THE README.md.
# ===================================================

drive=$(cat EMMC-DRIVE)
filename=''
bs=16M

function warning() {
  echo "======================================================"
  echo "You are about to $1 the WHOLE emmc card on drive ${drive}".
  echo "======================================================"
  read -p "Continue? (y/n): " continue
  if [ "$continue" != "y" ]
  then
    echo "Aborting"
    exit
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
  warning WIPE

  check $drive

  echo "Beginning copy ..."
  sudo dd if=/dev/zero bs=${bs} of=${drive}
else
  echo "=============================================================================="
  echo "=============================================================================="
  echo ""
  echo "Please edit EMMC-DRIVE in order to activate this script. See Readme.md."
  echo ""
  echo "=============================================================================="
  echo "=============================================================================="
fi
