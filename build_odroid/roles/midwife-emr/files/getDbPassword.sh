#!/bin/bash
# Returns to stdout the database password in use.

grep dbPass /etc/midwife-emr/midwife-emr.json |cut -d ":" -f2|sed -e 's/\s*"\(.*\)",/\1/'
