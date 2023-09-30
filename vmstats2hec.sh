#!/bin/bash
splunk_server="your server address"
hec_token="your hec token"
splunk_index="your index"

/usr/bin/python /root/scripts/vmstat_json.py | /usr/bin/python /root/scripts/json2hec.py ${hec_token} ${splunk_server} '{"index":"'${splunk_index}'", "host":"'${HOSTNAME}'", "source":"vmstat", "sourcetype":"vmstat-json"}'
