#!/bin/bash
################################################################################
#   Script Name : 04_CHECK_SRVS_STATUS.sh
#   Version     : V 2.0
#   Date        : 28/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

DIR=$1
DAYS=$2

if [[ $# -ne 2 ]]
then
echo -e "Usage: $0 </var/log> <No of Days> <Arcv_Dir>"
exit
fi
    if [[ -d $DIR ]]
    then
    echo -e "The Directory has Given is found it."
    echo -e "would you want to compress the file (yes/no)"
    read ANSWER
               if [[ $ANSWER == "yes" ]]
               then
               find $DIR -iname "*" -type f -mtime $DAYS -exec cp -p {} /ARCV \;
               tar -cvjf backup.tar.bz2 /ARCV
               echo "compress file done succesfully"
               else
               echo "compress file not done successfully"
               fi
    else
    echo "Direcroy not found to your system"
    fi
