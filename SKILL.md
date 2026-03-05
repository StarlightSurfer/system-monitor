---
name: system-monitor
description: "Check macOS system status (CPU, memory, disk, processes). Use when: user asks about system performance, resource usage, running processes, or disk space. NOT for: remote server monitoring, detailed performance profiling, or historical metrics analysis."
metadata:
  {
    "openclaw":
      {
        "emoji": "🖥️",
        "requires": { "bins": ["top", "df", "ps"] },
      }
  }
---

# System Monitor Skill

Monitor macOS system resources and running processes.

## When to Use

✅ **USE this skill when:**

- "How's my system doing?"
- "Check CPU/memory usage"
- "How much disk space is left?"
- "What processes are running?"
- "Why is my Mac slow?"
- System performance troubleshooting

## When NOT to Use

❌ **DON'T use this skill when:**

- Remote server monitoring → use SSH + remote tools
- Detailed performance profiling → use Instruments/profiling tools
- Historical metrics → use monitoring solutions (Prometheus, etc.)
- Network diagnostics → use network-specific tools (ping, traceroute)
- Battery/energy monitoring → use `pmset` or Activity Monitor

## Quick Commands

### System Overview

```bash
# Quick summary (recommended for chat responses)
echo "🖥️ macOS System Status"
echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 CPU: $(top -l 1 | grep 'CPU usage' | awk -F',' '{print $1}' | sed 's/CPU usage: //')"
echo "💾 Memory: $(top -l 1 | grep 'PhysMem' | sed 's/PhysMem: //')"
echo "💿 Disk: $(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')% used"
```

### CPU Usage

```bash
# Current CPU usage
top -l 1 | grep 'CPU usage'

# Top 5 CPU-consuming processes
top -l 1 | grep -E '^[0-9]' | head -5

# CPU load average
sysctl vm.loadavg
```

### Memory Usage

```bash
# Physical memory summary
top -l 1 | grep 'PhysMem'

# Detailed memory info
vm_stat

# Top memory consumers
top -l 1 | grep -E '^[0-9]' | sort -rn -k4 | head -5
```

### Disk Usage

```bash
# Root disk usage
df -h /

# All mounted volumes
df -h

# Disk I/O stats
iostat -d disk0 1 2
```

### Process List

```bash
# Running processes (sorted by CPU)
ps aux | sort -nr -k 3 | head -10

# Running processes (sorted by Memory)
ps aux | sort -nr -k 4 | head -10

# Count running processes
ps aux | wc -l
```

## Quick Responses

**"How's my system?"**

```bash
# Complete overview
echo "🖥️ macOS System Status"
echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 CPU: $(top -l 1 | grep 'CPU usage' | awk -F',' '{print $1}' | sed 's/CPU usage: //')"
echo "💾 Memory: $(top -l 1 | grep 'PhysMem' | sed 's/PhysMem: //')"
echo "💿 Disk: $(df -h / | tail -1 | awk '{print $5}')"
echo "🔄 Processes: $(ps aux | wc -l | tr -d ' ') running"
```

**"Check disk space"**

```bash
df -h / | tail -1 | awk '{print "Total: "$2", Used: "$3", Available: "$4", Usage: "$5}'
```

**"What's using CPU?"**

```bash
top -l 1 | grep -E '^[0-9]' | head -5 | awk '{print $13": "$3"%"}'
```

**"Memory status"**

```bash
top -l 1 | grep 'PhysMem' | sed 's/PhysMem: /Memory: /'
```

## Response Format

Use emoji and clear formatting for chat responses:

```
🖥️ macOS System Status
━━━━━━━━━━━━━━━━━━━━━━
📊 CPU: 15% user, 8% sys, 77% idle
💾 Memory: 8G used, 2G free, 4G cached
💿 Disk: 45% used (250G/500G)
🔄 Processes: 342 running
```

## Notes

- Commands are macOS-specific (not Linux/Windows)
- No API key needed (uses built-in tools)
- Safe to run frequently (read-only operations)
- `top -l 1` captures a single snapshot (non-interactive)
- Disk usage shown for root volume (`/`) by default

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `top` hangs | Use `top -l 1` for single snapshot |
| Permission denied | Most commands don't require sudo |
| Disk full warning | Check `/` and `/System/Volumes/Data` |
| High CPU usage | Check top processes with `ps aux` |
