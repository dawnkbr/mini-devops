#!/bin/bash
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' ./nginx-access.log | sort | uniq -c | sort -n -r | head -n 5 | awk '{print $2,"-", $1, "requests"}'
echo ""
echo "Top 5 most requested paths:"
awk 'match($0, /[A-Z]+ ([^ ]+) HTTP/, arr) {print arr[1]}' ./nginx-access.log | sort | uniq -c | sort -n -r | head -n 5 | awk '{print $2,"-", $1, "requests"}'
echo ""
echo "Top 5 response status codes:"
awk 'match($0, /"[^"]*" ([0-9]{3})/, arr) {print arr[1]}' ./nginx-access.log | sort | uniq -c | sort -n -r | head -n 5 | awk '{print $2,"-", $1, "requests"}'

