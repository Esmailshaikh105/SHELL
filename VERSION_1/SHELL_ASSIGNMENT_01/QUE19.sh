#!/bin/bash

# MySQL credentials and settings
mysql_user="root"
mysql_password="root"

# Database and user details
new_db_name="cloud"
new_db_user="wsmail"
new_db_password="root"

# Function to execute MySQL queries
function execute_mysql_query {
    mysql -u "$mysql_user" -p"$mysql_password" -e "$1"
}

# Create the new database
execute_mysql_query "CREATE DATABASE IF NOT EXISTS $new_db_name;"

# Create the new user and set the password
# CREATE USER 'new_username'@'localhost' IDENTIFIED BY 'user_password';
execute_mysql_query "CREATE USER '$new_db_user'@'localhost' IDENTIFIED BY '$new_db_password';"

# Grant all privileges on the new database to the new user
execute_mysql_query "GRANT ALL PRIVILEGES ON $new_db_name.* TO '$new_db_user'@'localhost';"

# Flush privileges to apply changes
execute_mysql_query "FLUSH PRIVILEGES;"

echo "Database, user, and privileges created successfully."
