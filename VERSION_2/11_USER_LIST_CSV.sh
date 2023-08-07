#!/bin/bash
################################################################################
#   Script Name : USERS_LIST_CSV,sh
#   Version     : V 2.1
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################
USER_FILE="USERS.csv"
PASS_FILE="/etc/passwd"
ADDED_USER_FILE="NEW_USERS.csv"

if [ ! -f "$USER_FILE" ]; then
  echo "Error: USERS.csv file not found."
  exit 1
fi

if [ ! -r "$USER_FILE" ]; then
  echo "Error: Cannot read USERS.csv file."
  exit 1
fi

if [ -e "$ADDED_USER_FILE" ]; then
  echo "Warning: NEW_USERS.csv file already exists. It will be overwritten."
fi

while IFS= read -r USERNAME
do
  if grep -q "^${USERNAME}:" "$PASS_FILE"; then
    echo "User $USERNAME is already present."
  else
    echo "User $USERNAME is not present. Adding..."
    if useradd "$USERNAME"; then
      echo "$USERNAME" >> "$ADDED_USER_FILE"
      echo "User $USERNAME successfully added."
    else
      echo "Error: Failed to add user $USERNAME."
    fi
  fi
done < "$USER_FILE"

