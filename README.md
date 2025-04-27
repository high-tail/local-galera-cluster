# Local MariaDB Galera Cluster with HAProxy, ProxySQL, Prometheus, and Grafana

This project sets up a local MariaDB Galera Cluster ecosystem with HAProxy and ProxySQL for load balancing, and Prometheus and Grafana for monitoring. It uses Docker and Docker Compose to orchestrate the services.

---

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Prerequisites](#prerequisites)
4. [Setup Instructions](#setup-instructions)
5. [Service Details](#service-details)
6. [Monitoring and Metrics](#monitoring-and-metrics)
7. [Troubleshooting](#troubleshooting)
8. [Contributing](#contributing)

---

## Overview

This setup provides:
- A **MariaDB Galera Cluster** for high availability and scalability.
- **HAProxy** for Layer 4 load balancing of database traffic.
- **ProxySQL** for intelligent query routing and Layer 7 load balancing.
- **Prometheus** for metrics collection.
- **Grafana** for visualizing metrics and dashboards.

---

## Architecture

The architecture consists of the following components:

- **MariaDB Galera Cluster**: Three database nodes (`node1`, `node2`, `node3`) configured for synchronous replication.
- **ProxySQL**: Three ProxySQL instances (`proxysql1`, `proxysql2`, `proxysql3`) for query routing and load balancing.
- **HAProxy**: A single HAProxy instance for TCP-level load balancing.
- **Prometheus**: A metrics collection system.
- **Grafana**: A visualization tool for monitoring metrics.

---

## Prerequisites

Before starting, ensure you have the following installed:

- **Docker**: Version 20.10 or later.
- **Docker Compose**: Version 1.29 or later.
- At least **4 GB of free memory** for running the containers.

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-repo/local-galera-cluster.git
cd local-galera-cluster
```

### 2. Build and Start the Containers

```bash
# Build the Docker images
docker-compose build

# Start the services
docker-compose up -d
```

### 3. Verify the Setup

Check the logs to ensure all services are running:

```bash
docker-compose logs -f
```

---

## Service Details

### MariaDB Galera Cluster

- **Nodes**: `node1`, `node2`, `node3`
- **Default Credentials**:
  - Username: `root`
  - Password: `root`
- **Login Instructions**:
  ```bash
  docker-compose exec node1 bash
  mariadb -uroot -proot
  ```

### ProxySQL

- **Instances**: `proxysql1`, `proxysql2`, `proxysql3`
- **Admin Interface**:
  - Port: `6032`
  - Username: `radmin`
  - Password: `radmin`
- **Login Instructions**:
  ```bash
  docker-compose exec proxysql1 bash
  mysql -uradmin -pradmin -P6032
  ```

### HAProxy

- **Instance**: `haproxy`
- **Stats Dashboard**:
  - URL: [http://localhost:8404/stats](http://localhost:8404/stats)
  - Metrics Endpoint: [http://localhost:8404/metrics](http://localhost:8404/metrics)

### Prometheus

- **Instance**: `prometheus`
- **URL**: [http://localhost:9090](http://localhost:9090)

### Grafana

- **Instance**: `grafana`
- **URL**: [http://localhost:3000](http://localhost:3000)

---

## Monitoring and Metrics

### Prometheus

Prometheus collects metrics from:
- **Node Exporter**: For system-level metrics.
- **MySQL Exporter**: For database metrics.
- **HAProxy**: For load balancer metrics.

### Grafana

Grafana is preconfigured with:
- A **Prometheus data source**.
- Dashboards for:
  - **MariaDB Galera Cluster health**.
  - **Query performance**.
  - **HAProxy traffic metrics**.

---

## Troubleshooting

### Common Issues

1. **MariaDB Node Fails to Start**
   - Check the logs:
     ```bash
     docker-compose logs node1
     ```
   - Ensure the `wsrep_cluster_address` is correctly configured.

2. **ProxySQL Connection Issues**
   - Verify the ProxySQL admin interface:
     ```bash
     docker-compose exec proxysql1 bash
     mysql -uradmin -pradmin -P6032
     ```

3. **HAProxy Not Routing Traffic**
   - Check the HAProxy stats dashboard:
     [http://localhost:8404/stats](http://localhost:8404/stats)

4. **Prometheus or Grafana Not Accessible**
   - Ensure the containers are running:
     ```bash
     docker-compose ps
     ```

---