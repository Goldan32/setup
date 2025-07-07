#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

if [ "$(readlink "$HOME/.zshrc")" == ".dotfiles/.zshrc" ]; then
    log "Success (already done)"
    exit 0
fi

curdir="$(pwd)"
rm -rf "$HOME/.dotfiles"
git clone https://github.com/Goldan32/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles" || exit 1
stow --no-folding .
git remote set-url origin ssh://git@github.com/Goldan32/dotfiles
cd "$curdir" || exit 2

if [ "$(readlink "$HOME/.zshrc")" == ".dotfiles/.zshrc" ]; then
    log "Success"
    exit 0
fi

log "Failed"
exit 3

