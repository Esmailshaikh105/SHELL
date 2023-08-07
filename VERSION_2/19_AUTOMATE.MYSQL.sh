#!/bin/bash

DB_NAME=$1
DB_USER_NAME=$2
SRV_NAME="mariadb"
MYSQL_USER="root"
mysql_password="root"
new_db_password="root"

# Function to execute MySQL queries
function execute_mysql_query {
    mysql -u "$MYSQL_USER" -p"$mysql_password" -e "$1"
}

if [[ $# -eq 2 ]]; then
    echo -e "I'M RUNNING SCRIPT"
    systemctl is-active -q $SRV_NAME
    EXT_STS=$?
    if [[ $EXT_STS == 0 ]]; then
        echo -e "$SRV_NAME is running"
        execute_mysql_query "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
        execute_mysql_query "CREATE USER '$DB_USER_NAME'@'localhost' IDENTIFIED BY '$new_db_password';"
        execute_mysql_query "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'localhost';"
        execute_mysql_query "FLUSH PRIVILEGES;"
      echo "Database, user, and privileges created successfully."
    else
        echo -e "$SRV_NAME is not running"
        echo -e "Please start the service & re-run the script."
    fi
else
    echo -e "This script requires exactly 2 arguments"
    echo -e "Usage : $0 DB_NAME DB_USER_NAME"
    exit 0
fi

