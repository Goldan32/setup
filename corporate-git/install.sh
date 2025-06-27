#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

CONF="$HOME/.config/git/user-professional"

if [ -f "$CONF" ]; then
    log "Success (already done)"
    exit 0
fi

log "Action required"

echo ""
echo "Create \`$CONF\` with content:"
echo '
[user]
    name = "Your Corpo Name"
    email = "your.corpo@email.com"
'

log "Failed (action required)"

