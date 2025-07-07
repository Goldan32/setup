#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

packages=(\
   "stylua" \
   "sccache" \
   "zellij" \
   "rg" \
   "cargo-generate" \
)

to_be_installed=()

for pkg in "${packages[@]}"; do
    if [ ! -f "$HOME/.cargo/bin/$pkg" ]; then
        to_be_installed+=("$pkg")
    fi
done

if (( ${#to_be_installed[@]} == 0 )); then
    log "Success (already done)"
    exit 0
fi

cargo_to_path

if cargo install "${to_be_installed[@]}"; then
    log "Success"
    exit 0
fi

log "Failed"
exit 1

