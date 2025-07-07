#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

if which pyenv > /dev/null; then
    log "Success (already done)"
    exit 0
fi

PYENV_DIR="$HOME/.local/programs/pyenv"

curdir="$(pwd)"
rm -rf "$PYENV_DIR"
git clone https://github.com/pyenv/pyenv.git "$PYENV_DIR"
cd "$PYENV_DIR" \
    && src/configure \
    && make -C src \
    || log "Without bash extension"
cd "$curdir" || exit 2

if [ -d "$PYENV_DIR" ] > /dev/null; then
    log "Success"
    exit 0
fi

log "Failed"
exit 3

