#!/usr/bin/python

import fileinput
import re

res_secs = []
pattern_secs = re.compile(r"^    secs: ")
res_nsecs = []
pattern_nsecs = re.compile(r"^    nsecs: ")   

def filter():
    for line in fileinput.input():
        # print (line)
        if (pattern_secs.search(line) != None):
            time_secs = float(line.rstrip('\n').replace('    secs: ',''))
            res_secs.append(time_secs)
        elif (pattern_nsecs.search(line) != None):
            time_nsecs = float(line.rstrip('\n').replace('    nsecs: ',''))
            res_nsecs.append(time_nsecs)

try:
    filter()
except KeyboardInterrupt:
    # print("saving")
    pass

# zip the lists together - first method
# res1 = list(zip(res_secs, res_nsecs))

# or use the ; to separate the numbers
res2 = ""
for i in range(len(res_secs)):
    tstamp = res_secs[i] + (res_nsecs[i] * (10**(-9)))
    formatted_tstamp = "{:.6f}".format(tstamp)
    res2 = res2 + str(formatted_tstamp) + ", "

print(res2)
