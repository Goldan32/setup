#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

which dunst > /dev/null || sudo apt install -y dunst

dunst_status="$(systemctl --user is-active dunst)"

if [ "$dunst_status" == "active" ]; then
    log "Success (already done)"
    exit 0
fi

systemctl --user enable --now dunst.service

if [ "$dunst_status" == "active" ]; then
    log "Success"
    exit 0
fi

log "Failed (service error)"
exit 1
