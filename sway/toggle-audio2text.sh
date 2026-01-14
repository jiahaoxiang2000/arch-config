#!/bin/bash

# Audio2Text toggle script for Sway
# Usage: Toggle audio2text on/off with notifications

LOG_FILE="/tmp/audio2text-toggle.log"

echo "=== Toggle started: $(date) ===" >> "$LOG_FILE"

if pidof -q audio2text; then
    echo "audio2text is running, stopping..." >> "$LOG_FILE"
    pkill audio2text
    dunstify "Audio2Text" "Audio2Text Stopped"
    echo "Stopped audio2text" >> "$LOG_FILE"
else
    echo "audio2text not running, starting..." >> "$LOG_FILE"
    audio2text &
    dunstify "Audio2Text" "Audio2Text Started"
    echo "Started audio2text (PID: $!)" >> "$LOG_FILE"
fi

echo "=== Toggle completed: $(date) ===" >> "$LOG_FILE"
