#!/bin/bash

# Simple Ollama setup script on REPACSS
echo "Setting up Ollama..."

# Auto-detect group name by checking where user's home directory is located
echo "Auto-detecting group name..."

# Method 1: Check if user's home is under /mnt structure
USER_HOME_PATH=$(eval echo ~$USER)
if [[ "$USER_HOME_PATH" == /mnt/*/home/* ]]; then
    GROUP_NAME=$(echo "$USER_HOME_PATH" | cut -d'/' -f3)
    echo "Detected group name from home directory: $GROUP_NAME"
else
    # Method 2: Look for user directory in /mnt/*/home/
    POSSIBLE_PATH=$(find /mnt -type d -path "*/home/$USER" 2>/dev/null | head -1)
    if [ -n "$POSSIBLE_PATH" ]; then
        GROUP_NAME=$(echo "$POSSIBLE_PATH" | cut -d'/' -f3)
        echo "Found group name by searching: $GROUP_NAME"
    else
        # Method 3: Fallback - ask user
        echo "Could not auto-detect group name."
        read -p "Please enter your group name: " GROUP_NAME
    fi
fi

# Step 1: Export environment variable
export SCRATCH_BASE="/mnt/${GROUP_NAME}/home/$USER"
echo "SCRATCH_BASE set to: $SCRATCH_BASE"

# Step 2: This function will pick an available random port and start Ollama server:
source ollama.sh

# Step 3: Start ollama serve in background
ollama serve &

echo "Ollama setup complete!"
