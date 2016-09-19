#!/bin/bash

# Only update permissions if permissions need to be updated
if [[ $(stat -c %U:%G /var/run/bird) != "bird:bird" ]]; then
    sudo chown bird:bird /var/lib/bird
fi

# Create log directory, with appropriate permissions
if [[ ! -d "/var/log/kolla/bird" ]]; then
    mkdir -p /var/log/kolla/bird
fi

if [[ $(stat -c %a /var/log/kolla/bird) != "755" ]]; then
    chmod 755 /var/log/kolla/bird
fi
