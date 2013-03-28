#!/bin/sh

minutes=${1}

for file in $(ls ~/Downloads/)
do
    ~/scripts/accessed_in.sh ~/Downloads/$file $minutes
    if [ $? = 0 ]
    then
	echo $file
    fi
done
