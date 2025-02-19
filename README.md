# Local MariaDB Galera Cluster Set Up
### How to start
```bash
# Build containers
docker-compose build

# Start nodes
docker-compose up -d

# Check logs
docker-compose logs -f
```

## How to login to MariaDB
```bash
# 1. login to DB server (node1 or node2 or node3)
docker-compose exec node1 bash

# 2. login to MariaDB
mariadb -uroot -proot 
```
