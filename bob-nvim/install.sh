#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

BOB_NVIM_BIN="$HOME/.local/share/bob/nvim-bin/nvim"

if [ -f "$BOB_NVIM_BIN" ]; then
    log "Success (already done)"
    exit 0
fi

cargo install bob-nvim
"$HOME/.cargo/bin/bob" install nightly
"$HOME/.cargo/bin/bob" use nightly

if [ -f "$BOB_NVIM_BIN" ]; then
    log "Success"
    exit 0
fi

log "Failed"
exit 1

