#!/bin/sh

minutes=${1}
gracePeriod=${2}

notify-send -t 5000 "These files will be deleted in ${gracePeriod} minutes:" "$(~/scripts/list_unused_files.sh ${minutes})"

