#!/bin/bash
################################################################################
#   Script Name : 20_WAETHER_RPT.sh
#   Version     : V 2.1
#   Date        : 31/7/2023
#   Purpose     : Write a shell script that retrieves the current weather for a specified location using a weather API.
################################################################################

LOCATION=$1

if [[ $# != 1 ]]
then
        echo -e "plz enter the location"
        exit 1
fi

if [[ $? == 0 ]]
then
        echo -e "Checking weather report for $LOCATION"
        curl wttr.in/~$LOCATION?lang=hi
else
        echo -e "weather report not generate."
fi

