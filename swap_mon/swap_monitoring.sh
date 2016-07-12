#!/bin/bash
DIR=/ub01/swp_mon/
swap=$(vmstat 1 10 | awk 'NR>3 { sum += $7 + $8 } END { print sum }')
if [ "$swap" -gt "0" ]
then
  echo "###############################################################" >>  ${DIR}top.log
  echo "$(date) Severe swapped. See top report below" >>  ${DIR}top.log
  top -n 1 -a -b >> ${DIR}top.log
  FILESIZE=$(stat -c%s "${DIR}top.log")
  echo "SEREVER SWAPPED AT $(date)!!! Size of top.log = $FILESIZE bytes." >> ${DIR}swap_monitoring.log
else
  echo "$(date) OK" >>  ${DIR}swap_monitoring.log
fi
