#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

BAT_BIN="${HOME}/.cargo/bin/bat"
if [ -f "$BAT_BIN" ]; then
    log "Success (already done)"
    exit 0
fi

cargo install bat
"$BAT_BIN" cache --build || log "Failed" && exit 1

log "Success"
exit 0

