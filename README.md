# Nix_PerfHEC
Send basic performance metrics to a Splunk metrics index. And view in an Splunk app.

'ansible' folder contains installation routines.
'PerfHEC' is an app that can be loaded on your search head.
  
Variables must be set in the group_vars/all.yml file.  
splunk_server_and_port - The fqdn name and port of your HEC endpoint. Such as "your-server.domain.com:8088"  
splunk_index - A normal index for collecting event data type.  
metrics_index - An index for collecting performance metrics.  
hec_token - A token to be used with HEC inputs, should have access to both indexes.
(Index and token creation may be done outside the app.)  

get_system_info.sh - Collects very basic information on systems.  
loadavg_metrics.sh - Collects the load average data from an endpoint.  
meminfo_metrics.sh - Sends metrics information.  
  
To install run the ansible-playbook nic_perfhec_config.yml after adjusting(IMPORTANT!!) options to suit your environment.    
  
The app PerfHEC can be loaded on the search head to provide sample searches and a basic dashboard for using the data.  

| mpreview `PerfHEC_metrics`   
to preview the data  
  
Enjoy.  