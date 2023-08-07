################################################################
#5. Write a shell script that checks for software updates      #
#and installs them automatically.                              # 
################################################################

#!/bin/bash

echo -e "........checking updates....|"
yum check-updates

read -p  "you want to udpate this package...(y/n)   :" CHOICE

shopt -s nocasematch

if [[ $CHOICE == y ]]
then
echo "updating $service"
yum update $update -y
else
echo "nothing was updated.."
exit 1
fi
