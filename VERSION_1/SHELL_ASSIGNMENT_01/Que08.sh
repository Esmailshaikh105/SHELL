#############################################################################################################
#8. Write a script that monitors a list of websites and sends an email notification if any of them are down.#
#############################################################################################################

#!/bin/bash

echo "Enter Website Name:" 

read website

STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" httpd://website)

if [$STATUS_CODE -ne 200]
then
echo "https://$website is down...|"
fi

if [$STATUS_CODE -ge 200]
then
echo "https://$website is up...|"
fi

#############################################################################################################
# curl - The curl command-line tool is used to transfer data to                                             #
#or from a server using various protocols, including HTTP                                                   #
# /dev/null: This option tells curl to discard the output from the requested URL and                        # 
# not save it to a file.                                                                                    #
# -s: This option makes curl operate silently, suppressing the progress meter and error messages.           #
# w "%{http_code}\n": This option specifies a custom output format for curl,                                #
#specifically the HTTP status code. It uses the %{http_code} format specifier to display the status code    # 
#############################################################################################################