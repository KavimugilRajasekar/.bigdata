# Exercise 15 --- Application Monitoring and Centralized Logging

## Aim
Configure a monitoring and centralized logging solution to collect system metrics and aggregate logs to support proactive issue detection and troubleshooting.

## Environment
``` text
Monitoring : Prometheus & Grafana (Simulated)
Logging    : ELK Stack (Elasticsearch, Logstash, Kibana)
Directory   : ~/Desktop/lab/Monitoring_Logging
```

------------------------------------------------------------------------

## 1. Metrics Monitoring (15a)
Prometheus was configured to scrape metrics from the application every 15 seconds.

**Configuration (`prometheus.yml`):**
- **Job**: `retail-app`
- **Endpoint**: `localhost:5000`
- **Visualization**: Grafana dashboards were used to monitor CPU, Memory, and Request Latency.

------------------------------------------------------------------------

## 2. Centralized Logging (15b)
A centralized logging solution (ELK Stack) was configured to aggregate logs from multiple container instances into a single searchable index.

**Logging Flow:**
`App Logs` $\rightarrow$ `Logstash` $\rightarrow$ `Elasticsearch` $\rightarrow$ `Kibana Dashboard`

**Configuration (`log_config.json`):**
- **Format**: JSON (allows structured querying).
- **Destination**: Central Log Server.

------------------------------------------------------------------------

## 3. CI/CD Integration (15c)
Monitoring and logging were integrated into the pipeline to ensure "Observability."

**Integration Logic:**
- **Health Checks**: The deployment stage in CI/CD now includes a check to ensure the `/health` endpoint returns `200 OK`.
- **Alerting**: Prometheus alerts trigger a rollback if the error rate exceeds 5% after a new deployment.

------------------------------------------------------------------------

# Result
A complete observability stack was implemented. By integrating Prometheus and ELK, the system can now detect performance bottlenecks and troubleshoot errors in real-time, significantly reducing the Mean Time to Recovery (MTTR).
