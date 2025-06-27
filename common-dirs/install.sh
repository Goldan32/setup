#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

dirs_to_create=(\
    "$HOME/.local/programs" \
    "$HOME/.local/bin" \
    "$HOME/.screenshots" \
)

for dir_to_create in "${dirs_to_create[@]}"; do
    mkdir -p "$dir_to_create"
done

log "Success"
exit 0
