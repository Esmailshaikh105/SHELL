#!/bin/bash


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
else
echo "httpd service is  install"
fi


echo -e "writing index.html and conf file for the $DOMAIN"
echo -e "<!DOCTYPE html>
<html>
<head>
    <title>Welcome to $DOMAIN</title>
</head>
<body>
    <h1>Hello, World! This is $DOMAIN</h1>
</body>
</html>" >>/var/www/html/index1.html
echo -e "==================="
