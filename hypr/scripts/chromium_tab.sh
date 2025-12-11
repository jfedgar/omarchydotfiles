#!/bin/bash

# Get the active window information in JSON format
active_window=$(hyprctl activewindow -j)

# Extract the class name
class=$(echo "$active_window" | jq -r ".class")

# Check if the class matches chromium
if [[ "$class" == "chromium" ]]; then
    # If Chromium, send CTRL + T to the specific window address
    address=$(echo "$active_window" | jq -r ".address")
    hyprctl dispatch sendshortcut "CTRL, T, address:$address"
else
    # If NOT Chromium, run your normal command
    # REPLACE THE LINE BELOW with your actual terminal command (e.g., kitty, alacritty, foot)
    hyprctl dispatch togglefloating
fi
