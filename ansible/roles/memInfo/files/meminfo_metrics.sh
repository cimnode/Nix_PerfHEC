#!/bin/bash
splunk_server_and_port="your server address:port_number"
hec_token="your hec token"
metrics_index="your index"

for line in $(cat /proc/meminfo | grep "MemTotal\|MemFree\|SwapTotal\|SwapFree" | sed -r 's/^(\w+):\s+([0-9]+).*$/\1\=\2/'); 
do 
  eval "$line"; 
done

curl -k "https://'${splunk_server_and_port}'/services/collector" \
    -H "Authorization: '${hec_token}'" \
    -d '{"event":"metric","fields": {"metric_name:MemTotalkB":"'${MemTotal}'","metric_name:MemFreekB":"'${MemFree}'","metric_name:SwapFreekB":"'${SwapFree}'","metric_name:SwapTotalkB":"'${SwapTotal}'"},"index":"'${metrics_index}'","host":"'${HOSTNAME}'", "sourcetype": "meminfo", "source":"/proc/meminfo","time":"'$(date +%s)'"}'