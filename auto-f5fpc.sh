#!/bin/bash

function getStatus () {
        f5fpc --info | grep 'disconnected\|Client not connected' && return 1
        return 0
}

while [[ 1 ]]; do
        getStatus
        if [[ $? == 1 ]]; then
                echo "F5 VPN is not connected"
                echo "Reconnecting"
                f5fpc --host f5.server.hostname.com --user username --password password --start
                sleep 10
        fi
        sleep 6
done
