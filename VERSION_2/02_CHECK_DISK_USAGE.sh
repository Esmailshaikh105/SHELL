#!/bin/bash
################################################################################
#   Script Name : 02_CHECK_DISK_USAGE.sh                                                      
#   Version     : V 2.0                                                          
#   Date        : 24/7/2023                                                    
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON 
#                response to print instance IDs and its public and private IP address.
################################################################################
function DISK_MAIL () {
echo -e "Hello All
                  This is system generated email, do not reply to this email.
                  partitions on host `/bin/hostname` is reached to threshold.
                  Kindly take necessary action ASAP to avoid future inconvenience.
                  Server Name : - `hostname`
                  Server IP :- `ifconfig | grep inet | head -n 1 | awk  '{print $2}'`
Thank & Regards
Team CloudEthix (Esmail) "
}
WARN=60
df -h / | grep /dev/sda2 > /tmp/df.txt
while read C1 C2 C3 C4 C5 C6
do
            CHK=`echo $C5 | cut -d'%' -f1`
            if [[ $CHK -gt $WARN ]]
            then
            #echo -e "\n********************WARNING**********************"
            #echo -e "\nYour Disk Utilization of $C6 is Reached To Threshold $C5"
            DISK_MAIL
            else
            echo -e "\nYour Disk Utilization is under Threshold $C5"
             fi
done < /tmp/df.txt
