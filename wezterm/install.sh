#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh


if [ -f "$HOME/.local/bin/wezterm" ]; then
    log "Success (already done)"
    exit 0
fi

create_symlink() {
    ln -s "$HOME/.local/programs/wezterm/target/release/wezterm" "$HOME/.local/bin/wezterm"
}

# Maybe it's just not symlinked
if [ -f "$HOME/.local/programs/wezterm/target/release/wezterm" ]; then
    create_symlink
    log "Success (symlink created)"
    exit 0
fi

# Build it
current_dir="$(pwd)"
cd "$HOME/.local/programs" || exit 1
git clone --depth=1 --branch=main --recursive https://github.com/wezterm/wezterm.git
cd wezterm || exit 2
git submodule update --init --recursive
./get-deps
cargo build --release
cd "$current_dir" || exit 3

if [ -f "$HOME/.local/programs/wezterm/target/release/wezterm" ]; then
    create_symlink
    log "Success"
    exit 0
fi

log "Failed"
exit 3

