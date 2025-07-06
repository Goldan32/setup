#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

if [[ "$(grep "^$USER" /etc/passwd | awk -F ':' '{print $7}')" =~ "zsh" ]]; then
    log "Success (already done)"
    exit 0
fi

sudo usermod -s /bin/zsh $USER || log "Failed"; exit 1

log "Success"
exit 0

