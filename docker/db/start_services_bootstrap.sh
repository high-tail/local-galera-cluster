#!/bin/sh

# Start MariaDB with the original entry point
docker-entrypoint.sh mariadbd --wsrep-new-cluster &

# Start Node Exporter
node_exporter &

# Start MySQL Exporter
mysqld_exporter --config.my-cnf=/etc/.my.cnf &

# Keep the container running
tail -f /dev/null