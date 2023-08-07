#!/bin/bash
#!/bin/bash
################################################################################
#   Script Name : 10_AWS_INSTANCE.sh
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################
instance_id=$1
which aws
if [ $? -eq 0 ]
then
    echo "Aws cli is installed"
else
    echo "Aws cli is not installed"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
fi

echo "Now checking if aws creds are configured"

aws sts get-caller-identity
if [ $? -eq 0 ]
then
    echo "Aws configured"
    echo "Running command and check instance id private_ip and public_ip"
    aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].[InstanceId,PrivateIpAddress, PublicIpAddress]'  --output text
else
    echo "Configure AWS Cli & Then re-run the code"
    exit 127
fi
