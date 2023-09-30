#!/bin/bash
for line in $(cat /proc/meminfo | grep "MemTotal\|MemFree\|SwapTotal\|SwapFree" | sed -r 's/^(\w+):\s+([0-9]+).*$/\1\=\2/'); 
do 
  eval "$line"; 
done

curl -k "https://pony:8088/services/collector" \
    -H "Authorization: Splunk c68d66cf-88f7-4a48-b37c-e7e4e4962823" \
    -d '{"event":"metric","fields": {"metric_name:MemTotalkB":"'${MemTotal}'","metric_name:MemFreekB":"'${MemFree}'","metric_name:SwapFreekB":"'${SwapFree}'","metric_name:SwapTotalkB":"'${SwapTotal}'"},"index":"cimnet_metrics","host":"'${HOSTNAME}'", "sourcetype": "meminfo", "source":"/proc/meminfo","time":"'$(date +%s)'"}'
