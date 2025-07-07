#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

TARGET_DIR="$HOME/.local/programs/firefox"
LINK_DIR="${HOME}/.local/bin"

if [ -f "$LINK_DIR/nightly" ]; then
    log "Success (already done)"
    exit 0
fi

# Temporary download location
TMP_FILE=$(mktemp)

mkdir -p "$TARGET_DIR"

# Download Firefox Nightly
curl -sL "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US" -o "$TMP_FILE"

# Extract the archive into the target directory
tar -xf "$TMP_FILE" -C "$TARGET_DIR" --strip-components=1

# Clean up
rm "$TMP_FILE"

ln -s "${TARGET_DIR}/firefox" "${LINK_DIR}/nightly"

if [ -f "$LINK_DIR/nightly" ]; then
    log "Success"
    exit 0
fi

log "Failed"
exit 1

