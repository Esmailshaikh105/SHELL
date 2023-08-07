#!/bin/bash
################################################################################
#   Script Name : 13_VHOST_WEB_SERVER.sh
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################
DOMAIN=$1
if [[ $# -ne 1 ]]
then
echo -e "please enter atleat one domain"
fi

echo "httpd service is installed or not"
    systemctl status httpd > /dev/null 2>&1
    if [[ $? -gt 0 ]];
    then
    echo "plz install httpd service"
    yum install httpd -y
    echo -e "starting httpd service"
    systemctl start httpd
    echo -e "enable httpd service"
    systemctl enable httpd
    else
    echo "httpd service is  install"
    fi
##plz disable the firewalld
systemctl stop firwalld

echo -e "writing index.html and conf file for the $DOMAIN"
echo -e "<!DOCTYPE html>
<html>
<head>
    <title>Welcome to $DOMAIN</title>
</head>
<body>
    <h1>Hello, World! This is $DOMAIN</h1>
</body>
</html>" >/var/www/html/index1.html
echo -e "==================="

