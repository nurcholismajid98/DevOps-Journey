echo "========== Memory Usage =========="
free -h | grep Mem | awk '{print "Used: " $3 " / Total: " $2 " (" int($3/$2*100) "%)"}'

echo "========== CPU Load =========="
uptime | awk '{print "Load Average: " $(NF-2) ", " $(NF-1 ", " $NF)}'

# Warning jika disk >80% atau memory used >80%
DISK_PERCENT=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
MEM_PERCENT=$(free | grep Mem | awk '{print int($3/$2*100)}')
if [ $DISK_PERCENT -gt 80 ] || [ $MEM_PERCENT -gt 80 ]; then
	echo "ALERT: Resource tinggi! Disk: $DISK_PERCENT% | Memory: $MEM_PERCENT%"
else
	echo "System stabli (Disk: $DISK_PERCENT% | Memory: $MEM_PERCENT%)"
fi
