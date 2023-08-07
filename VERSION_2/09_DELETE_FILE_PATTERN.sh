#!/bin/bash
################################################################################
#   Script Name : 09_DELETE_PATTERN_FILE.sh
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

DIR=$1
FILE_PATTERN=$2

if [[ $# -eq 2 ]]; then
    echo -e "I M RUNNING SCRIPT"

find $DIR -name $FILE_PATTERN -exec ls -lhrt {} \;

read -p "would you delete FIle Pattern (yes or no)" ANSWER
      shopt -s nocasematch
      if [[ $ANSWER == "yes" ]]
      then
      echo "Scanning Directory in to your system"
      find $DIR -type f -name "*.txt" -exec rm {} \;
      echo "file delete succesfully"
      else
      echo -e "$DIR not found in your system"
      fi

else
    echo -e "This script requires exactly 2 arguments"
    echo -e "Usage : DIR AND FILE_PATTERN"
    exit 0
fi
         
