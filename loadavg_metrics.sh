#!/bin/bash
splunk_server_and_port="your server address:port_number"
hec_token="your hec token"
metrics_index="your index"

read -r load1 load5 load15 <<< $(cut -d " " -f 1,2,3 /proc/loadavg)

curl -k "https://'${splunk_server_and_port}'/services/collector" \
    -H "Authorization: Splunk '${hec_token}'" \
    -d '{"event":"metric","fields": {"metric_name:load1":"'${load1}'","metric_name:load5":"'${load5}'","metric_name:load15":"'${load15}'"},"index":"'${metrics_index}'","host":"'${HOSTNAME}'", "sourcetype": "loadaverage", "source":"/proc/loadavg"}'
