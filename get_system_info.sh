#!/bin/bash
cpu_count=$(grep -c  ^processor  /proc/cpuinfo)
mem_total_kb=$(cat /proc/meminfo | grep ^MemTotal | cut -d ":" -f 2 | xargs | cut -d " " -f 1)
HOSTNAME=$(uname -n| xargs)
splunk_server_and_port="your server address"
hec_token="your hec token"
splunk_index="your index"

#echo $cpu_count
#echo $mem_total_kb

curl -k "https://'${splunk_server_and_port}'/services/collector" \
    -H "Authorization: Splunk '${hec_token}'" \
    -d '{"event": {"cpu_count":"'${cpu_count}'","mem_total_kb":"'${mem_total_kb}'"},"index":"'${splunk_index}'","host":"'${HOSTNAME}'", "sourcetype": "systeminfo", "source":"get_system_info.sh"}'

