#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

packages=(\
    "bash-language-server" \
    "markdownlint-cli" \
    "typescript" \
    "typescript-language-server" \
    "prettier" \
    "svelte" \
    "pyright" \
    "shellcheck" \
)

NVM_DIR="$HOME/.local/programs/nvm"
. "$NVM_DIR/nvm.sh"

to_be_installed=()

for pkg in "${packages[@]}"; do
    if ! npm -g ls "$pkg" > /dev/null; then
        to_be_installed+=("$pkg")
    fi
done

if (( ${#to_be_installed[@]} == 0 )); then
    log "Success (already done)"
    exit 0
fi

if npm install -g "${to_be_installed[@]}"; then
    log "Success"
    exit 0
fi

log "Failed"
exit 1

