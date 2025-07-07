#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

which dunst > /dev/null || sudo apt install -y dunst


if [ "$(systemctl --user is-active dunst)" == "active" ]; then
    log "Success (already done)"
    exit 0
fi

systemctl --user disable swaync
systemctl --user mask swaync
systemctl --user daemon-reload
systemctl --user enable --now dunst.service

if [ "$(systemctl --user is-active dunst)" == "active" ]; then
    log "Success"
    exit 0
fi

log "Failed (service error)"
exit 1
