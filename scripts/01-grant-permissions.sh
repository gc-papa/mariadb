#!/bin/bash
# 01-grant-permissions.sh

# Output for debugging (optional, remove or hide sensitive info in production)
echo "Granting privileges to MYSQL_USER: $MYSQL_USER with provided MYSQL_PASSWORD."

# Wait for MariaDB to be fully up and running
until mariadb-admin ping -h "localhost" --silent; do
    echo 'Waiting for MariaDB to be fully up and running...'
    sleep 1
done

# Execute SQL commands to grant privileges
mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOSQL
