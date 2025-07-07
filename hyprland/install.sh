#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

if which hyprland > /dev/null; then
    log "Success (already done)"
    exit 0
fi

cargo_to_path

cd "$HOME" || exit 1
rm -rf ~/Ubuntu-Hyprland-24.04
git clone -b 24.04 --depth=1  https://github.com/JaKooLit/Ubuntu-Hyprland.git ~/Ubuntu-Hyprland-24.04
cd "$HOME/Ubuntu-Hyprland-24.04" || exit 2
chmod +x install.sh
./install.sh

log "Success"
exit 0
