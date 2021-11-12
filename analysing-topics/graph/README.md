## filter.py
The `filter.py` is a script to extract the timestamps from the header. This is used in the `get-timestamp.sh` script. We can get the timestamps by running the following command.
```
rostopic echo -b <rosbag-file> <topic> | python filter.py
```

## topics.txt
A list of topics from the ROSBAG. We can get another `topics.txt` by running the following command in the terminal.
```
rostopic list -b <rosbag-file> > topics.txt
```

## get-timestamp.sh
Use this shell script to get the timestamps of the topics. To execute this script, it expects 3 arguments.
```
./get-timestamps.sh <filter.py> <rosbag-file> <topics.txt>
```
Running this will return a list of topics and timestamps in CSV file under `timestamp.csv`.

### alternatively
We can get the timestamps chosen topics by adding them into the timestamp file individually. First, initialise the timestamp file.
```
touch <timestamp-file>
```
Then, add individual topic's timestamp using this command
```
echo "<topic>," $(rostopic echo -b <rosbag-file> <topic> | python filter.py) > <timestamp-file>
```

## make-graph.R
Before running the script, we need to adjust the x-limit of the graph by editing the values in `xlim <- c(_, _)`, the number of calls to observe by changing the parameter for `len`, and the duration of each filtering by adjusting the timeout `<time>`s. Use this Rscript to generate a graph based on the timestamps and the index list of the topics being shown by running the following command.
```
Rscript make-graph.R <timestamp-file>
```
Running this will write a graph called `timestamp-graph.png` and an index lis of topics called `index-topics.csv`.
Improvement to be made:
1. We can make the code selective by only showing the topics that have timestamps.
2. There is still a problem about importing the data into R, where there seems to be a maximum number of columns that R can take. This prevent us from getting the graph. I will look into that.
