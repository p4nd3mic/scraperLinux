#!/bin/sh

minutes=${1}

for file in $(list_unused_files.sh ${minutes})
do
    rm -rf ~/Downloads/$file
done
