#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

if [ -f /etc/pam.d/hyprlock ]; then
    log "Success (already done)"
    exit 0
fi

sudo su -c 'echo "auth include login" > /etc/pam.d/hyprlock' || exit 1

log "Success"
exit 0

