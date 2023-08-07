#!/bin/bash
################################################################################
#   Script Name : 04_CHECK_SRVS_STATUS.sh
#   Version     : V 2.0
#   Date        : 28/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

     echo -e "....checking updates...."
     if   ! yum check-update &>/dev/null; then
     echo "Error: Unable to check for updates. Make sure you have an active internet"
     exit 1
     fi

# Count the number of available updates
  num_updates=$(yum check-update | grep -v "^$" | wc -l)
  if [[ $num_updates -eq 0 ]]; then
  echo "No updates available."
  exit 0
  fi
  echo "Number of updates available: $num_updates"

# Display the list of available updates
     yum check-update
     read -p "Do you want to update the available packages? (y/n): " CHOICE
     shopt -s nocasematch
     if [[ $CHOICE == y ]]; then
     echo "Updating packages..."
     if ! yum update -y; then
     echo "Error: Failed to update packages. Please check your internet connection and try again."
     exit 1
     fi
