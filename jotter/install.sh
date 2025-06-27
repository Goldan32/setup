#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

INSTALL_DIR="$HOME/.local/programs/jotter"

if [ -f "$INSTALL_DIR/target/release/jotter" ]; then
    log "Success (already done)"
    exit 0
fi

curdir="$(pwd)"
git clone https://github.com/Goldan32/jotter "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit 1
cargo build --release || exit 2
ln -s "$INSTALL_DIR/target/release/jotter" "$HOME/.local/bin/task"
cd "$curdir" || exit 3

log "Success"
exit 0
