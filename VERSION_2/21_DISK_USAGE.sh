cript Name : 21_USER_DISK_USAGE.sh
#   Version     : V 2.1
#   Date        : 31/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################


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
