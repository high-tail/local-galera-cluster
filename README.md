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

### How to login to MariaDB
```bash
# 1. login to DB server (node1 or node2 or node3)
docker-compose exec node1 bash

# 2. login to MariaDB
mariadb -uroot -proot
```

### How to login to ProxySQL
```bash
# 1. login to ProxySQL server (proxysql1 or proxysql3 or proxysql3)
docker-compose exec proxysql1 bash

# 2. login to ProxySQL
mysql -uradmin -pradmin -P6032
```
