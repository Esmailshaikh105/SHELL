#!/bin/bash
################################################################################
#   Script Name : 02_CHECK_DISK_USAGE.sh
#   Version     : V 2.0
#   Date        : 24/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

MAIN_WORD=$1
REPLACE_WORD=$2
DIR=$3

if [[ $# -ne  3 ]]
then
        echo -e "plz enter atleast 3 arguments"
        exit 1
fi

grep -r "$MAIN_WORD" $DIR  > /dev/null 2>&1
if [[ $? == 0 ]]
then
        sed -i "s/$MAIN_WORD/$REPLACE_WORD/gi"  $DIR/*
else
        echo -e "$MAIN_WORD not found"
fi

