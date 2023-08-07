#!/bin/bash
################################################################################
#   Script Name : 09_MONITOR_WEBSITE.sh
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################
WEBSITE=$1

if [[ $# -eq 1 ]]; then
    echo -e "I M RUNNING SCRIPT"

EMAIL() {
    echo -e "Hello All
                  This is system generated email, do not reply to this email.
                  partitions on host $(/bin/hostname) is reached to threshold.
                  Kindly take necessary action ASAP to avoid future inconvenience.
                  Server Name : - $(hostname)
                  Server IP :- $(ifconfig | grep inet | head -n 1 | awk '{print $2}')
Thank & Regards
Team CloudEthix (Esmail) "
}

STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" httpd://website)
            if [[ $STATUS_CODE -ge 200 ]]
            then
            echo "https://$WEBSITE is up...|"
            else
            echo "https://$WEBSITE is down...|" 
            EMAIL
            fi
else
    echo -e "This script requires exactly 1 arguments"
    echo -e "Usage : $0 WEBSITE"
    exit 0
fi
