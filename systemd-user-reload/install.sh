#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/../utils.sh

systemctl --user daemon-reload

log "Success"
exit 0

