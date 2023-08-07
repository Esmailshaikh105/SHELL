#Write a shell script that renames a large number of files based on a specified 
#pattern or naming convention.

#!/bin/bash
################################################################################
#   Script Name : 09_MONITOR_WEBSITE.sh
#   Version     : V 2.0
#   Date        : 29/7/2023
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON
#                response to print instance IDs and its public and private IP address.
################################################################################

if [ $# -ne 2 ]; then
    echo "plz enter atleat 3 arguments"
    exit 1
fi
if [ ! -d "$1" ]; then
    echo "plz enter the directory path"
    exit 1
fi

directory="$1"
pattern="$2"

cd "$directory"

for file in *; do
    if [ -f "$file" ]; then

        extension="${file#*.}"
        new_name="${pattern}_${file}"
        mv "$file" "$new_name"
        echo "Renamed: $file -> $new_name"
    fi
done
