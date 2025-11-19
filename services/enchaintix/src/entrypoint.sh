#!/bin/sh
set -e

# Функция для перезапуска tcpdump+nc при падении
start_sniffer() {
  while true; do
    echo "[$(date)] Starting tcpdump → nc..."
    tcpdump -U --immediate-mode -ni eth0 -s 65535 -w - 'not tcp port 22' | nc -l -p 57012
    echo "[$(date)] tcpdump/nc exited (code: $?); restarting in 1s..."
    sleep 1
  done
}

# Запускаем сниффер в фоне
start_sniffer &

# Запускаем основное приложение в foreground
exec python app.py --host 0.0.0.0
