### Monitoring

Prometheus

Links to download Prometheus, Node_Exporter & black Box exporter
https://prometheus.io/download/
Extract and Run Prometheus
After downloading Promethous extract the .tar file
Now Cd into the extracted file and and run
./prometheus &
By default Prometheus runs on Port 9090 and access it using your instance
<IP address>:9090
Similarly download and run Blackbox exporter.
./ backbox_exporter &
Grafana
Links to download Grafana https://grafana.com/grafana/download
OR
Run This code on Monitoring VM to Install Grafana
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_10.4.2_amd64.deb
sudo dpkg -i grafana-enterprise_10.4.2_amd64.deb
once Installed run
sudo /bin/systemctl start Grafana-server
by default Grafana runs on port 3000 so access it using instance <IPaddress>:3000
DevOps Pipeline
SHUBHAM MUKHERJEE
Configure Prometheus
Go inside the Prometheus.yaml file and edit it
scrape_configs: - job_name: 'blackbox' metrics_path: /probe
params:
module: [http_2xx] # Look for a HTTP 200 response. static_configs: - targets: - http://prometheus.io # Target to probe with http. - https://prometheus.io # Target to probe with https. - http://example.com:8080 # Target to probe with http on port 8080. relabel_configs: - source_labels: [__address__]
target_label: __param_target
- source_labels: [__param_target]
target_label: instance
- target_label: __address__
replacement:<IP address>:9115
Replace the IP address with your instance IP address. After this Restart Prometheus using this command
pgrep Prometheus
Once you run the above command you will get the Id of Prometheus
then use the id and kill it
kill <ID>
Add Prometheus as Data sources inside Grafana
Go to Prometheus server > Data Sources
> Prometheus add IPaddress of Prometheus
> Import Dashboard form web
