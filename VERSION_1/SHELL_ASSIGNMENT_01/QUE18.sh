#!/bin/bash

TIME=$1
DIR=$2

if [[ -d $DIR ]]
then
  echo -e "file are change $TIME mins in $DIR"

  FNAME=$(find "$DIR" -type f -mmin -"$TIME" -exec ls -lhrt {} \; | wc -l)
  if [ $FNAME -eq 0 ]; then
    echo -e "There are no files that were modified in the last $TIME mins in $DIR"
  else
    echo -e "The files were modified in the last $TIME mins in $DIR"
    find "$DIR" -type f -mmin -"$TIME" -exec ls -lhrt {} \;
  fi
else
  echo -e "$DIR not found. Please check!!"
fi
