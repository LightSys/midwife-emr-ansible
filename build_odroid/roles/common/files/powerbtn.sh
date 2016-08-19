#!/bin/sh
# /etc/acpi/powerbtn.sh
# Initiates a shutdown when the power putton has been
# pressed.

/usr/bin/logger -t "SHUTDOWN" "Power button pressed"
/sbin/shutdown -h now "Power button pressed"
