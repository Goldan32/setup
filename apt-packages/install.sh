#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

apt_packages=(\
    "curl" \
    "tar" \
    "wget" \
    "build-essential" \
    "cmake" \
    "ninja-build" \
    "gettext" \
    "pkg-config" \
    "unzip" \
    "git" \
    "libssl-dev" \
    "stow" \
    "zsh" \
    "xz-utils" \
    "llvm" \
    "bzip2" \
    "libsqlite3-dev" \
    "jq" \
)

to_be_installed=()

for pkg in "${apt_packages[@]}"; do
    if ! dpkg -s "$pkg" 1> /dev/null 2>&1; then
        to_be_installed+=("$pkg")
    fi
done

if ! (( ${#to_be_installed[@]} )); then
    log "Success (already done)"
    exit 0
fi

sudo apt update
for pkg in "${to_be_installed[@]}"; do
    sudo apt install -y "$pkg" || exit 1
done

log "Success"
exit 0

