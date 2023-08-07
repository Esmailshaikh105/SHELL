#!/bin/bash
################################################################################
#   Script Name : 09_MONITOR_WEBSITE.sh
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

Log_file="/var/log/secure"
###check if file is exists or not
if [[ -f $Log_file ]]
then
    echo -e "$Log_file found"
    read -p "Do U want to check bad login attempts ? (Y/N):" CHOICE
    shopt -s nocasematch
    if [ "$CHOICE" = "Y" ]
    then
        VAR=`grep 'Failed password' /var/log/secure | wc -l`
        echo "failed ssh login attempts"
        echo "$VAR"
    else
        echo "no ssh failed login attempts found"
    fi
else
    echo "$Log_file not found"
  fi
