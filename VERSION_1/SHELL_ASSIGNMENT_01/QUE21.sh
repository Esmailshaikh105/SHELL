#!/bin/bash

USER=$1

if [[ $# -ne 1 ]]
then
        echo -e "plz enter atleast one argument"
        exit 1
fi

cat /etc/passwd | grep $USER
if [[ $? == 0 ]]
then
        echo -e " Checking disk usage for $User"
        du -sh /home/$USER
        elif [[ $USER == "root" ]]
        then
                echo "Checking disk space for root"
                du -sh /root
else
        echo -e "User $USER is not found"
        exit 1
fi