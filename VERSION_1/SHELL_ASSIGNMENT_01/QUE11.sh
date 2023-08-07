#!/bin/bash


IP_FILE=ismail.csv
OP_FILE=Ismail.txt

if [[ ! -f $IP_FILE ]]
then
        echo -e "Please provide the file $IP_FILE"
        exit 1
fi

while IFS=':' read -r line1
do
        useradd $line1 >/dev/null 2>&1
        if [[ $? == 0 ]]
        then
                useradd "$line1"
                echo -e "Added User: $line1 and Password: $PASSWORD" >> $OP_FILE
        else
                echo -e "User $line1 exists"
        fi
done <$IP_FILE
