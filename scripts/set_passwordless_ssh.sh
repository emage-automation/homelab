#!/bin/bash

# List of servers
servers=("192.168.1.62" "192.168.1.65" "192.168.1.66" "192.168.1.68" "192.168.1.67")

# SSH Key
ssh_key="$HOME/.ssh/id_rsa.pub"

# Check if SSH key exists
if [ ! -f "$ssh_key" ]; then
    echo "SSH key not found, generating one..."
    ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -q -N ""
fi

# Copy SSH key to each server
for server in "${servers[@]}"; do
    echo "Copying SSH key to $server..."
    ssh-copy-id -i "$ssh_key" ubuntu@$server
done

echo "Passwordless SSH setup complete."
