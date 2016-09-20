#!/bin/bash

# create empty socket with user felix
if [[ ! -e /run/felix-driver.sck ]]; then
    touch /run/felix-driver.sck
    chmod 755 /run/felix-driver.sck
    chown felix:felix /run/felix-driver.sck
fi

# Create log directory, with appropriate permissions
if [[ ! -d "/var/log/kolla/felix" ]]; then
    mkdir -p /var/log/kolla/felix
fi

if [[ $(stat -c %a /var/log/kolla/felix) != "755" ]]; then
    chmod 755 /var/log/kolla/felix
fi
