#!/bin/bash

# Enable strict mode to improve script reliability
set -euo pipefail
IFS=$'\n\t'

# Function to log messages
log() {
    local msg="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $msg"
}

# Change to the script's directory (optional)
# cd "$(dirname "$0")"

# Pull the latest changes from the git repository
log "Running git pull..."
if git pull; then
    log "git pull succeeded."
else
    log "git pull failed."
    exit 1
fi

# Run Hugo to generate the site
log "Running hugo..."
if hugo; then
    log "hugo command succeeded."
else
    log "hugo command failed."
    exit 1
fi

log "Script completed successfully."
