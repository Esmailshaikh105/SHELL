###################################################################################################
#10.A shell script that fetches data from an AWS EC2 API and processes the JSON response to print #
#instance IDs and its public and private IP address                                               #  
###################################################################################################

#!/bin/bash
DVNL=/dev/null
IN_FILE=file.txt
OUT_FILE=AWS.INSTANCE.OP
which aws

if [[ $? == 0 ]]
then 
ech0 -e "aws cli is installed"
else
echo -e "aws cli is not installed"
fi

aws sts get-caller-identity > $DVNL 2>&1

if [[ $? == 0 ]]
then
echo -e "Aws configured"
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, State.Name]" --o text >$IN_FILE

while read line1 line2 
do
if [[ $line2 == "running" ]]
then
aws ec2 describe-instances | jq -r 'Reservations[]|.Instances[]|[.Instanceid,.PrivateIpAddress,.PublicAddress]@csv'| sort | grep $line1

else 

echo -e "$line1 is not running"

fi
done <$OUT_FILE
else
echo -e "aws is not configured plz configured"
fi

