# Nix_PerfHEC
Send basic performance metrics to a Splunk metrics index.
  
Each shell script has variables that must be set specfic to your environment.   
splunk_server_and_port - The fqdn name and port of your HEC endpoint. Such as "your-server.domain.com:8088"  
splunk_index - A normal index for collecting event data type.  
metrics_index - An index for collecting performance metrics.  
hec_token - A token to be used with HEC inputs, should have access to both indexes.
  
get_system_info.sh - Collects very basic information on systems.  
loadavg_metrics.sh - Collects the load average data from an endpoint.  
meminfo_metrics.sh - Sends metrics information.  
  
To install run the corresponding ansible routine based on the script you wish to install.  
  
json2hec.py is example code for sending a JSON data to an endpoint. Sample invocation can be found by looking at vmstat_json.py and vmstats2hec.sh.   
