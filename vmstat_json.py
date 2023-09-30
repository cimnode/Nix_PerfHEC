import subprocess, json

lines = subprocess.Popen("vmstat 1 2| awk '!( $1 ~ /^[0-9]+$/ && x++ == 0)'", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.readlines()
line1 = lines[1].split()
line2 = lines[2].split()
if len(line1) == len(line2):
  new_dict = {}
  for a in range(0,  len(line1) ):
    new_dict[line1[a]] = line2[a]
  print(json.dumps(new_dict))
else:
  message = "ERROR: Unexpected vmstat lines."
  data = lines[1:]
  print message
