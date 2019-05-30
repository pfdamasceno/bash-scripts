#!/bin/bash
LOCATION=/
THRESHOLD=75
USAGE=$(df $LOCATION| grep $LOCATION | awk '{ print $5}' | sed 's/%//g')

if [ "$USAGE" -gt "$THRESHOLD" ] ; then
    mail -s 'Disk Space Alert' pablo.damasceno@ucsf.edu << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi

# To run it daily, save the script to the file sample.sh in your home directory,
# change the email to your email,
# and add the following line at the end of /etc/crontab file
# @daily ~/sample.sh

