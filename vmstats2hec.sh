#!/bin/bash
/usr/bin/python /root/scripts/vmstat_json.py | /usr/bin/python /root/scripts/json2hec.py c68d66cf-88f7-4a48-b37c-e7e4e4962823 pony '{"index":"cimnet_systems", "host":"'${HOSTNAME}'", "source":"vmstat", "sourcetype":"vmstat-json"}'
