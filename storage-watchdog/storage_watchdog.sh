#!/bin/bash
LOCATION=/media/rajlab/sachin_data_1
THRESHOLD=75
USAGE=$(df $location| grep $location | awk '{ print $5}' | sed 's/%//g')

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    mail -s 'Disk Space Alert' mailid@domainname.com << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi

# To run it daily, save the script to storage_watchdog.sh in your home directory,
# change the email to your email,
# and add the following line at the end of /etc/crontab file:
# @daily ~/sample.sh
# by Mallik Arjun
