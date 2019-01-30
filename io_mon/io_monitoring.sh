#!/bin/bash
str=`sar -b |tac|grep -m 16 '.'| awk 'NR>1 {bread += $6 ; bwrtn += $7; count++} END {print int(bread/count), int(bwrtn/count)}'`
bread=$(echo $str | cut -f1 -d' ')
bwrtn=$(echo $str | cut -f2 -d' ')

if [[ "$bread" -gt 170000 || "$bwrtn" -gt 170000 ]]
then echo -e "ALERT!\nbread = $bread\nbwrtn = $bwrtn"|mail -s "I/O Limit ALERT" kokokoko@kokoko.com
fi
