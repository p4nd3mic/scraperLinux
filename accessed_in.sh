#!/bin/sh

FILE=${1}

accessed=$(stat -c %X $FILE)
currentTime=$(date +%s)

minutes=${2}
seconds=$(($minutes * 60))

if [ $(( $currentTime - $accessed )) -le $seconds ]
then
    exit 0
else
    exit 1
fi




 
