#!/bin/bash

MAIN_WORD=$1
REPLACE_WORD=$2
DIR=$3

if [[ $# -ne  3 ]]
then
        echo -e "plz enter atleast 3 arguments"
        exit 1
fi

grep -r "$MAIN_WORD" $DIR
if [[ $? == 0 ]]
then
        grep -r "$MAIN_WORD" $DIR | sed  's/$MAIN_WORD/$REPLACE_WORD/'
else
        echo -e "$MAIN_WORD not found"
fi
