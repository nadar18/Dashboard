#!/bin/bash

# Load configuration
source "$(dirname "$0")/config.sh"

LOGFILE="$HOME/tab_switch.log"

echo "Starting tab switcher at $(date)" >> "$LOGFILE"

# Start Chromium if not already running
if ! pgrep -x "chromium-browser" > /dev/null; then
  chromium-browser --noerrdialogs --kiosk "$KIOSK_URL" --incognito --disable-translate &
  sleep 10  # Allow time to fully load
fi

# Infinite tab switch loop
while true; do
  CHROME_WIN=$(xdotool search --onlyvisible --class "chromium" | head -n 1)
  if [ -n "$CHROME_WIN" ]; then
    xdotool windowactivate "$CHROME_WIN"
    sleep 0.5

    xdotool mousemove $TAB1_X $TAB1_Y click 1
    echo "$(date): Clicked TAB 1" >> "$LOGFILE"
    sleep 60

    xdotool mousemove $TAB2_X $TAB2_Y click 1
    echo "$(date): Clicked TAB 2" >> "$LOGFILE"
    sleep 60

    xdotool mousemove $TAB3_X $TAB3_Y click 1
    echo "$(date): Clicked TAB 3" >> "$LOGFILE"
    sleep 60
  else
    echo "$(date): Chromium not detected" >> "$LOGFILE"
    sleep 10
  fi
done
