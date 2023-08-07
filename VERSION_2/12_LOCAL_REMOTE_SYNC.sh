#!/bin/bash
################################################################################
#   Script Name : 12.REMOTE_LOCAL_SYNC.SH
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

SOURCE_DIR=$1
REMOTE_USER=$2
REMOTE_IP=$3
REMOTE_LOCATION=$4
NULL_FILE="/dev/null"


if [[ $# -eq 4 ]]
then
     echo -e "I M RUNNING SCRIPT"

if [[  -d $SOURCE_DIR ]]
     then
     echo -e "Source Directory Found  "
     rsync -avzh $SOURCE_DIR $REMOTE_USER@$REMOTE_IP:$REMOTE_LOCATION
     echo -e "Direcory goes suucssfully to remote location"
     else
     echo -e "Please Enter COrrect Source DIrectory"
     fi
else
     echo -e "This script requires exactly 4 arguments"
     echo -e "Usage : $0 SoURCE_DIR  REMOTE_USER REMOTE_IP REMOTE_LOCATION"
     exit 0
fi






