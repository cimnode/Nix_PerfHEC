# simple method to send json object to HEC
import sys, requests, urllib3, json, time
urllib3.disable_warnings()
data = json.loads(sys.stdin.read().decode('utf-8'))
request_data = json.loads(sys.argv[3].decode('utf-8'))
token =  sys.argv[1]
splunk_host = sys.argv[2]
request_data.update({"event":data})
request_data.update({"time":time.time()})
url = 'https://'+splunk_host+':8088/services/collector/event'
authHeader = {'Authorization': 'Splunk '+token}
r = requests.post('https://'+splunk_host+':8088/services/collector/event', headers={'Authorization': 'Splunk '+token}, json=request_data, verify=False)
#print r.text
