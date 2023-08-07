#!/bin/bash

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
