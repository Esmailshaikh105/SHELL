#!/bin/bash


###########################################################
#2. Write a shell script to monitor disk usage and send an#
#email alert if usage exceeds a specified threshold       #
##########################################################



VAL=`df -h | grep /dev/sdc | awk '{print $5}' | sed 's/%//'`
echo -e "checking disk usage"
if [[ $VAL -ge 1 ]]
 then
`echo  "the space about to end" || mail -e "disk usage alert" esmailshaikh105@gmail.com`
else
echo "to much space"
fi
