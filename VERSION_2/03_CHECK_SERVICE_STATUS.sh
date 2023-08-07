#!/bin/bash

################################################################################
#   Script Name : 03_CHECK_SRVS_STATUS.sh                                                    
#   Version     : V 2.0                                                          
#   Date        : 24/7/2023                                                    
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON 
#                response to print instance IDs and its public and private IP address.
################################################################################

SRV_NAME=$1
if [[ $# -eq 1 ]]
then
echo -e "I M RUNNING SCRIPT"
systemctl is-active -q $SRV_NAME
EXT_STS=$?
    if [[ $EXT_STS == 0 ]]
    then
    echo -e "$SRV_NAME is running"
    else
    echo -e  "$SRV_NAME is not running"
    read -p  "Do you want to restart the $SRV_NAME ? (y/n):" CHOICE
    shopt -s nocasematch
    if [[ $CHOICE == "y" ]]
    then
    systemctl restart $SRV_NAME
    echo -e "$SRV_NAME is restarted"
    else
    echo -e "Not starting the $SRV_NAME. Thank You. !!"
    fi
    shopt -u nocasematch
     fi
else
echo -e "This script requires exactly 1 arguments"
echo -e "Usage : $0 SRV_NAME"
exit 0
fi

