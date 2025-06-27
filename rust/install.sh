#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

if [ -f "$HOME/.cargo/bin/cargo" ]; then
    log "Success (already done)"
    exit 0
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

if [ -f "$HOME/.cargo/bin/cargo" ]; then
    log "Success"
    exit 0
else
    log "Failed"
    exit 1
fi

