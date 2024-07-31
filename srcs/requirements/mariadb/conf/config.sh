#!/bin/sh

# Configuration
DB_DIRECTORY="/var/lib/mysql"
RUNNING_DIRECTORY="/run/mysqld"
INIT_SQL="/var/lib/mysql/init_db.sql"
TEMP_SQL="/tmp/init_db_processed.sql"
MYSQL_USER="mysql"

# MySQL options
OPTIONS="--user=$MYSQL_USER \
         --skip-name-resolve \
         --skip-networking=0 \
         --bind-address=0.0.0.0"

# Function to log messages
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Ensure correct permissions
set_permissions() {
    if ! chown -R $MYSQL_USER:$MYSQL_USER $DB_DIRECTORY $RUNNING_DIRECTORY; then
        log_message "Failed to set permissions on $DB_DIRECTORY and $RUNNING_DIRECTORY"
        exit 1
    fi
}

# Initialize the MariaDB data directory
initialize_db() {
    if ! mysql_install_db --user=$MYSQL_USER --datadir=$DB_DIRECTORY > /dev/null; then
        log_message "Failed to create database"
        exit 1
    fi
    log_message "Database directory created successfully"
}

# Process initialization SQL script
process_init_script() {
    if [ -f "$INIT_SQL" ]; then
        if ! envsubst < "$INIT_SQL" > "$TEMP_SQL"; then
            log_message "Failed to process $INIT_SQL"
            exit 1
        fi
    else
        log_message "$INIT_SQL not found"
        exit 1
    fi
}

# Execute initialization script
execute_init_script() {
    if ! mysqld $OPTIONS --bootstrap < "$TEMP_SQL"; then
        log_message "Failed to execute initialization script"
        exit 1
    fi
    rm -f "$TEMP_SQL"
}

# Main execution
set_permissions
initialize_db
process_init_script
execute_init_script

log_message "Starting MySQL server"
exec mysqld $OPTIONS --console