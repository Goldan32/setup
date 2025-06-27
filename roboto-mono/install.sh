#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

if fc-list | grep RobotoMono > /dev/null; then 
    log "Success (already done)"
    exit 0
fi

FONT_DIR="/usr/local/share/fonts/roboto-mono"
sudo mkdir -p "$FONT_DIR"

sudo wget --content-disposition -P "$FONT_DIR" \
  https://github.com/googlefonts/RobotoMono/raw/refs/heads/main/fonts/ttf/RobotoMono-{Thin,Light,Regular,Medium,Bold,Italic,BoldItalic}.ttf

sudo fc-cache -f -v > /dev/null

if fc-list | grep RobotoMono > /dev/null; then 
    log "Success"
    exit 0
fi

log "Failed"
exit 1

