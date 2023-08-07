#!/bin/bash
################################################################################
#   Script Name : 15_FIND_DIR_DAYS.sh
#   Version     : V 2.1
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

DIR=$1
DAYS=$2

if [[ $# -eq 1 ]]; then
echo -e "USAGE: $0 <DIR> <NO OF DAYS>"
exit 1
fi

if [[ -d $DIR ]]
then
echo -e "DIrectory Found it"
echo -e "Would you want to check directory tree that have not 
been accessed in a specified number of days (yes or no)..."
read answer
  shopt -s nocasematch
  if [[ answer == "yes" ]];
  then
  echo -e "see the directory of no of days"
  find "$DIR" -type -f -mtime +"$DAYS"  --print
  else
  echo " not a valid answer"
  fi
else
echo -e "directory not found into the system"
fi



