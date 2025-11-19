#!/bin/sh
set -e

# Start tcpdump → netcat in background
tcpdump -U --immediate-mode -ni eth0 -s 65535 -w - 'not tcp port 22' | nc -l -p 57012 &
TCPDUMP_PID=$!

# Run main app (foreground)
exec python app.py --host 0.0.0.0
