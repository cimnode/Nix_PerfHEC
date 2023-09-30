#!/bin/bash
read -r load1 load5 load15 <<< $(cut -d " " -f 1,2,3 /proc/loadavg)

curl -k "https://pony:8088/services/collector" \
    -H "Authorization: Splunk c68d66cf-88f7-4a48-b37c-e7e4e4962823" \
    -d '{"event":"metric","fields": {"metric_name:load1":"'${load1}'","metric_name:load5":"'${load5}'","metric_name:load15":"'${load15}'"},"index":"cimnet_metrics","host":"'${HOSTNAME}'", "sourcetype": "loadaverage", "source":"/proc/loadavg"}'
