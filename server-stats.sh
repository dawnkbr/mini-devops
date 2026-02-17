#!/bin/bash

CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {print 100 - $NF"%"}')

MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", $MEM_USED*100/$MEM_TOTAL}")

DISK_TOTAL=$(df -m / | awk 'NR==2 {print $2}')
DISK_USED=$(df -m / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -m / | awk 'NR==2 {print $4}')
DISK_PERCENT=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "CPU Usage:    $CPU_USAGE"
echo "RAM Total:    ${MEM_TOTAL}MB"
echo "RAM Used:     ${MEM_USED}MB ($MEM_PERCENT%)"
echo "RAM Free:     ${MEM_FREE}MB"
echo "Disk Usage:  $DISK_USED / ${DISK_TOTAL}MB ($DISK_PERCENT %)"


echo "------------------------------------------"
echo "TOP 5 cpu-usage process:"
echo "------------------------------------------"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6 | awk '{printf "%-10s %-25s %s\n", $1, $2, $3}'

echo ""
echo "------------------------------------------"
echo "TOP 5 ram-usage process:"
echo "------------------------------------------"
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6 | awk '{printf "%-10s %-25s %s\n", $1, $2, $3}'

