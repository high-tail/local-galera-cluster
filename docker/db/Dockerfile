FROM mariadb:latest
RUN apt-get update && apt-get install -y vim galera-4 wget

# Install Node Exporter
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz \
    && tar xvfz node_exporter-1.3.1.linux-amd64.tar.gz \
    && mv node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/ \
    && rm -rf node_exporter-1.3.1.linux-amd64 node_exporter-1.3.1.linux-amd64.tar.gz

# Install MySQL Exporter
RUN wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.14.0/mysqld_exporter-0.14.0.linux-amd64.tar.gz \
    && tar xvfz mysqld_exporter-0.14.0.linux-amd64.tar.gz \
    && mv mysqld_exporter-0.14.0.linux-amd64/mysqld_exporter /usr/local/bin/ \
    && rm -rf mysqld_exporter-0.14.0.linux-amd64 mysqld_exporter-0.14.0.linux-amd64.tar.gz

# Copy the start_services.sh script into the container
COPY start_services.sh /usr/local/bin/start_services.sh
RUN chmod +x /usr/local/bin/start_services.sh

# Expose ports for Node Exporter and MySQL Exporter
EXPOSE 9100 9104

ENTRYPOINT ["/usr/local/bin/start_services.sh"]