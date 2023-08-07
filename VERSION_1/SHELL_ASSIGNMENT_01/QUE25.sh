#!/bin/bash

# File to store the report
report_file="/tmp/new_user_report.txt"

# Get the current date and time in epoch format for comparison
current_date=$(date +%s)

# Calculate the timestamp for 24 hours ago
twenty_four_hours_ago=$((current_date - 86400))

# Extract user details from the /etc/passwd file using awk
awk -v twenty_four_hours_ago="$twenty_four_hours_ago" -F':' '
  $3 >= twenty_four_hours_ago {
    print "Username: " $1;
    print "User ID: " $3;
    print "Group ID: " $4;
    print "User Info: " $5;
    print "Home Directory: " $6;
    print "Shell: " $7;
    print "==================================";
  }
' /etc/passwd > "$report_file"

# Send the report via email
mail -s "New User Accounts Report" esmailshaikh105@gmail.com < "$report_file"
