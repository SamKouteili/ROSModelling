#!/bin/sh
echo "Getting information for all the topics\n"
echo "********************\n"
if [ "$#" -gt "0" ]
then 
	for f in $(rostopic list)
	do
	  echo "Processing topic $f"
	  echo "Topic: $f \n" >> $1
	  rostopic info $f >> $1
	  echo "Message ($f) type:" >> $1
	  rosmsg show $(rostopic type $f) >> $1
	  echo "********************\n" >> $1
	done
else 
	for f in $(rostopic list)
	do
	  echo "Topic: $f \n"
	  rostopic info $f
	  echo "Message ($f) type:"
	  rosmsg show $(rostopic type $f)
	  echo "********************\n"
	done
fi
echo "Done"
