#!/bin/bash

# Usage function
usage() {
    echo "Usage: $0 <server_ip> <timeout>"
    exit 1
}

# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

# IP address or hostname of the server
SERVER_IP="$1"

# Timeout value in seconds
TIMEOUT="$2"

# Attempt SSH connection and suppress output
ssh -q -o ConnectTimeout=$TIMEOUT root@$SERVER_IP "exit"

# Check the exit status
if [ $? -eq 0 ]; then
    echo "SSH connection successful."
else
    echo "SSH connection failed."
fi
