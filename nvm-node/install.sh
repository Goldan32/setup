#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

NVM_DIR="$HOME/.local/programs/nvm"

install_lts() {
    export NVIM_DIR
    . "$NVM_DIR/nvm.sh"
    nvm install --lts
    nvm alias default lts/*
}

# Maybe have nvm but not node
if which node > /dev/null; then
    log "Success (already done)"
    exit 0
elif [ -f "$NVM_DIR/nvm.sh" ]; then
    install_lts
    log "Success (installed node)"
    exit 0
fi

git clone https://github.com/nvm-sh/nvm.git "$HOME/.local/programs/nvm"
install_lts

if which node > /dev/null; then
    log "Success"
    exit 0
fi

log "Failed"
exit 1

