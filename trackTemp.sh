#!/bin/bash
if [[ $1 == "" ]]; then
	echo "Please add an interval like 'trackTemp.sh 10'"
	exit
fi
oldtemp=$(sensors | grep "Core 0" | awk '{print $3}')
echo "The current temperature is ${oldtemp}"
while :
do
	newtemp=$(sensors | grep "Core 0" | awk '{print $3}')
	if [[ ! ${oldtemp} == "${newtemp}" ]]; then
	oldtemp=${newtemp}
	echo "The current temperature is ${oldtemp}"
	fi
	sleep "$1"
done
