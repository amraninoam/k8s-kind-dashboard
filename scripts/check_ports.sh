#!/bin/bash

# Define an array of ports to check
ports=(80 443)

# Function to check if a port is in use
is_port_in_use() {
    netstat -tuln 2>/dev/null | grep -q ":$1"
}

# Iterate over the ports and check if they are in use
for port in "${ports[@]}"; do
    if is_port_in_use "$port"; then
        echo "Error: Port $port is already in use. Exiting."
        exit 1
    fi
done

# If the script reaches this point, both ports are available
echo "Success: Ports 80 and 443 are available for use."
