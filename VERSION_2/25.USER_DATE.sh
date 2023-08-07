#!/bin/bash

RPT_FILE="/tmp/USER_RPT.TXT"
EMAIL_ID=esmailshaikh105@gmail.com

function MAIL () {
    echo -e "Hello All
                  This is system generated email, do not reply to this email.
                  sending a report of newly created user account into aur system
                  within the last 24 hours
                  Server Name : - `hostname`
                  Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'`
                  `cat $RPT_FILE`
Thank & Regards
Team CloudEthix (Esmail) " | mail -s "NEW CREATED USER ACCOUNT" $EMAIL_ID
}

 find /home -type d -ctime -1 -exec stat -c '%U - %n' {} \; | grep -v root > "$RPT_FILE"

    # Send the report via email
    if [ -s "$RPT_FILE" ]; then
        mail -s "New User Accounts Report" < "$RPT_FILE"
        echo "Report sent successfully to "
        MAIL
    else
        echo "No new user accounts found in the last 24 hours."
    fi


