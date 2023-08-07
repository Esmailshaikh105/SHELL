#!/bin/bash
################################################################################
#   Script Name : 09_MONITOR_WEBSITE.sh
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################
Dir1=$1
Dir2=$2
OUTPUT_FILE=$3

if [[ $# -eq 3 ]]; then
echo -e "I M RUNNING SCRIPT"

     if [[ -d $Dir1 && -d $Dir2 ]]; then
     echo -e  "both directory are found"

          if [[ `sdiff $Dir1 $Dir2` ]]
          then
          echo -e "checking the directory diffrence"
          sdiff $Dir1 $Dir2 > $OUTPUT_FILE
          else
          echo -e "no diffrence found"
          fi
    else
    echo -e "Directory not found"
    fi
else
echo -e "This script requires exactly 3 arguments"
echo -e "Usage : $0 DIR1 DIR2 OUTPUT_FILE"
exit 0
fi
