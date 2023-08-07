#!/bin/bash
################################################################################
#   Script Name : 01_LIST_FILE_FROM_DIR.sh
#   Version     : V 2.0
#   Date        : 24/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

TIME=$1
DIR=$2

    if [[ $# -eq 2 ]]; then
    echo -e "I M RUNNING SCRIPT"
if [[ -d $DIR ]]
then
echo -e "file are change $TIME mins in $DIR"

    FNAME=$(find "$DIR" -type f -mmin -"$TIME" -exec ls -lhrt {} \; | wc -l)
    if [ $FNAME -eq 0 ]; then
    echo -e "There are no files that were modified in the last $TIME mins in $DIR"
    else
    echo -e "The files were modified in the last $TIME mins in $DIR"
    find "$DIR" -type f -mmin -"$TIME" -exec ls -lhrt {} \;
    fi
else
  echo -e "$DIR not found. Please check!!"
fi
    else
    echo -e "This script requires exactly 2 arguments"
    echo -e "Usage : $0 TIME DIR"
    exit 0
fi
    
