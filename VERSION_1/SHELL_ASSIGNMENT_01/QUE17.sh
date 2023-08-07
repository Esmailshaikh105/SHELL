#!/bin/bash

Log_file="/var/log/secure"

if [[ -f $Log_file ]]
then
    echo -e "$Log_file found"
    read -p "Do U want to check bad login attempts ? (Y/N):" CHOICE
    if [ "$CHOICE" = "Y" ]
    then
        VAR=`cat /var/log/secure | grep 'Failed password' | awk '{print $15}'| sed 's/sshd.//' | wc -l`
        echo "failed ssh login attempts"
        echo "$VAR"
    else
        echo "no ssh failed login attempts found"
    fi
else
    echo "$Log_file not found"
  fi
