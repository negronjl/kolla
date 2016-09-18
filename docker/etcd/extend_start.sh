#!/bin/bash

# Only update permissions if permissions need to be updated
if [[ $(stat -c %U:%G /var/lib/etcd) != "etcd:etcd" ]]; then
    sudo chown etcd: /var/lib/etcd
fi

# Create log directory, with appropriate permissions
if [[ ! -d "/var/log/kolla/etcd" ]]; then
    mkdir -p /var/log/kolla/etcd
fi
if [[ $(stat -c %a /var/log/kolla/etcd) != "755" ]]; then
    chmod 755 /var/log/kolla/etcd
fi

#export config
export $(cat /etc/etcd)
