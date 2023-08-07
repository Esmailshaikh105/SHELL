#!/bin/bash

################################################################################
#   Script Name : 01_LIST_FILE_FROM_DIR.sh                                                      
#   Version     : V 2.0                                                          
#   Date        : 24/7/2023                                                    
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON 
#                response to print instance IDs and its public and private IP address.
################################################################################

SRC_DIR=$1
OUT_FILE="/tmp/out.txt"


if [[ $# -eq 1 ]]
then
	echo -e "I M RUNNING SCRIPT"
        if [[ ! -d $SRC_DIR ]]
        then
            echo -e "Directory not found $SRC_DIR. Please provide correct directory."
        else
            echo -e "Directory found $SRC_DIR. Gerating the output to $OUT_FILE file."
            tree $SRC_DIR > $OUT_FILE
        fi
else
	echo -e "This script requires exactly 1 arguments"
    echo -e "Usage : $0 SRC_DIR"
    exit 0
fi



