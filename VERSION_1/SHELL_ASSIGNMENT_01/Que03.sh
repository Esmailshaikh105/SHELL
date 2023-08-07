#!/bin/bash


##################################################################################################################
#  Write a shell script that checks whether a specified service is running and restarts it if it's not running   #
##################################################################################################################


service_name="apache2"

if  service  $service_name status running
then 
      echo "$service_name is running"
      else

echo "$service_name is not running"
 sudo service "$service_name" restart
 echo "$service_name is restarted"

fi

