#!/bin/sh
echo "Getting timestamps\n"
echo "********************\n"

# initialise the output file - must be new.
output=timestamp.csv
if test -f "$output"
then
    rm $output
    touch $output
else
    touch $output
fi
    
# we expect to get the arguments <filter.py> <rosbag-file> <topic.txt>
if [ "$#" -gt "2" ]
then
    # reading the topics.txt file and processing each topic
    for t in $(cat $3)
    do
	# inform which topic is being processed
	echo "Processing topic $t"
	# appending the topic's timestamps into the output file
	echo "$t," $(timeout 20s rostopic echo -b $2 $t | python $1) >> $output
    done
else 
    echo "Provide the arguments <filter.py> <rosbag-file> <topic.txt>"
fi
echo "Done"
