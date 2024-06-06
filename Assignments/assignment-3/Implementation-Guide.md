### Monitoring and Logging Setup with Prometheus, Grafana, and ELK Stack

This guide will help you set up a monitoring and logging solution for a sample application using Prometheus, Grafana, and the ELK stack (Elasticsearch, Logstash, Kibana). We'll deploy a sample application using Docker, configure Prometheus and Grafana for monitoring, and set up the ELK stack for logging.

### Prerequisites

Docker and Docker Compose installed
Basic understanding of Docker, Prometheus, Grafana, and the ELK stack

### Step 1: Setup

Deploy a Sample Application on Docker

Create a docker-compose.yml file to deploy a simple web application along with Prometheus, Grafana, and the ELK stack.

```docker-compose.yml
version: '3.7'

services:
  web:
    image: nginx:latest
    container_name: web_app
    ports:
      - "8080:80"
    logging:
      driver: "json-file"
      options:
        max-size: "200k"
        max-file: "10"

  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    volumes:
      - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"

  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - "3000:3000"
    volumes:
      - grafana-data:/var/lib/grafana

  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.13.4
    container_name: elasticsearch
    environment:
      - "discovery.type=single-node"
    ports:
      - "9200:9200"

  logstash:
    image: docker.elastic.co/logstash/logstash:7.13.4
    container_name: logstash
    volumes:
      - ./logstash/logstash.conf:/usr/share/logstash/pipeline/logstash.conf
    ports:
      - "5044:5044"

  kibana:
    image: docker.elastic.co/kibana/kibana:7.13.4
    container_name: kibana
    ports:
      - "5601:5601"

volumes:
  grafana-data:
```

Prometheus Configuration

Create a prometheus.yml file to configure Prometheus to scrape metrics from Docker containers.

```prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['prometheus:9090']

  - job_name: 'docker'
    static_configs:
      - targets: ['web_app:80']
```

Logstash Configuration

Create a logstash.conf file to configure Logstash to collect logs from the Docker containers.

```logstash.conf
input {
  file {
    path => "/var/lib/docker/containers/*/*.log"
    type => "docker"
    codec => "json"
  }
}

filter {
  if [type] == "docker" {
    json {
      source => "message"
      target => "docker"
    }
    mutate {
      remove_field => ["message"]
    }
  }
}

output {
  elasticsearch {
    hosts => ["http://elasticsearch:9200"]
    index => "docker-logs-%{+YYYY.MM.dd}"
  }
}
```

### Step 2: Monitoring and Logging Requirements

Collect Basic Metrics from Docker Containers

Prometheus will collect metrics from the Docker containers, such as CPU and memory usage.

Create Grafana Dashboards to Display Key Metrics

Access Grafana at http://localhost:3000 and add Prometheus as a data source. Create a dashboard with panels to display key metrics like CPU and memory usage.

Collect Logs from the Application Using Logstash

Logstash will collect logs from the Docker containers and send them to Elasticsearch.

Store Logs in Elasticsearch and Visualize Them in Kibana

Access Kibana at http://localhost:5601, configure the index pattern for docker-logs-*, and create visualizations and dashboards to view the logs.

### Step 3: Configuration Files

Prometheus Configuration (prometheus.yml)

```prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['prometheus:9090']

  - job_name: 'docker'
    static_configs:
      - targets: ['web_app:80']
```
Logstash Configuration (logstash.conf)

```logstash.conf
input {
  file {
    path => "/var/lib/docker/containers/*/*.log"
    type => "docker"
    codec => "json"
  }
}

filter {
  if [type] == "docker" {
    json {
      source => "message"
      target => "docker"
    }
    mutate {
      remove_field => ["message"]
    }
  }
}

output {
  elasticsearch {
    hosts => ["http://elasticsearch:9200"]
    index => "docker-logs-%{+YYYY.MM.dd}"
  }
}
```
Grafana Dashboard JSON

You can export the created dashboard JSON from Grafana. Here’s an example JSON snippet for CPU usage:

```grafana.json
{
  "panels": [
    {
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percent"
        }
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "id": 1,
      "options": {
        "orientation": "auto"
      },
      "targets": [
        {
          "expr": "rate(container_cpu_usage_seconds_total{image!=\"\"}[1m])",
          "interval": "",
          "legendFormat": "{{container}}",
          "refId": "A"
        }
      ],
      "title": "CPU Usage",
      "type": "gauge"
    }
  ],
  "title": "Docker Monitoring",
  "uid": "docker-monitoring"
}
```

### Step 4: Documentation and Screenshots

Setup Process

Docker Compose: Create a docker-compose.yml file to define and run all services.
Prometheus: Create a prometheus.yml file to configure Prometheus.
Logstash: Create a logstash.conf file to configure Logstash.
Grafana: Access Grafana, add Prometheus as a data source, and create dashboards.
Kibana: Access Kibana, configure the index pattern, and create visualizations.
How to View Metrics and Logs

Metrics: Access Grafana at http://localhost:3000 to view metrics dashboards.
Logs: Access Kibana at http://localhost:5601 to view log visualizations.
Step 5: Screenshots
Grafana Dashboard Screenshot

Include a screenshot showing the CPU and memory usage panels.
Kibana Log Visualization Screenshot

Include a screenshot showing the logs collected from the application.
By following this guide, you will have a fully automated setup for monitoring and logging a sample application using Prometheus, Grafana, and the ELK stack.





