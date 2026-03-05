#!/bin/bash
# system-status.sh - Quick system status summary
# Usage: ./system-status.sh

echo "🖥️ macOS System Status"
echo "━━━━━━━━━━━━━━━━━━━━━━"

# CPU
CPU_INFO=$(top -l 1 | grep 'CPU usage')
CPU_USER=$(echo "$CPU_INFO" | awk -F',' '{print $1}' | sed 's/CPU usage: //')
CPU_SYS=$(echo "$CPU_INFO" | awk -F',' '{print $2}' | sed 's/ //')
CPU_IDLE=$(echo "$CPU_INFO" | awk -F',' '{print $3}' | sed 's/ //')
echo "📊 CPU: $CPU_USER, $CPU_SYS, $CPU_IDLE"

# Memory
MEM_INFO=$(top -l 1 | grep 'PhysMem' | sed 's/PhysMem: //')
echo "💾 Memory: $MEM_INFO"

# Disk
DISK_INFO=$(df -h / | tail -1)
DISK_TOTAL=$(echo "$DISK_INFO" | awk '{print $2}')
DISK_USED=$(echo "$DISK_INFO" | awk '{print $3}')
DISK_AVAIL=$(echo "$DISK_INFO" | awk '{print $4}')
DISK_PCT=$(echo "$DISK_INFO" | awk '{print $5}')
echo "💿 Disk: $DISK_USED / $DISK_TOTAL ($DISK_PCT), $DISK_AVAIL available"

# Processes
PROC_COUNT=$(ps aux | wc -l | tr -d ' ')
echo "🔄 Processes: $PROC_COUNT running"

echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "Updated: $(date '+%Y-%m-%d %H:%M:%S')"
