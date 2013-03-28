#!/bin/sh

minutes=${1}

for file in $(ls ~/Downloads/)
do
    ./accessed_in.sh ~/Downloads/$file $minutes
    if [ $? = 0 ]
    then
	echo $file
    fi
done
