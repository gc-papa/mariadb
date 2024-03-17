#!/bin/sh
# dump-databases.sh

# Make sure the backup directory exists
mkdir -p /backup

# Dump all databases into a timestamped file
mysqldump --all-databases --single-transaction -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h mariadb >"/backup/alldb_$(date +%Y-%m-%d_%H%M%S).sql"

# Cleanup: Keep only the 3 most recent backups, delete the rest
cd /backup || exit

# List all files, sort them by modification time (newest first),
# skip the first 3 files, and delete the rest.
# This approach assumes file names are "safe" (no newlines, spaces are okay).
ls -t | tail -n +4 | xargs -r rm -f
