#!/bin/sh
# first argument is the file to store all the information
echo "Getting information for all the nodes\n"
if [ "$#" -gt "0" ]
then
	for f in $(rosnode list)
	do
	  echo "processing Node $f"
	  rosnode info $f >> $1
	done
else
	for f in $(rosnode list)
	do
	  rosnode info $f
	done
fi
echo "Done"
