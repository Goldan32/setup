#!/bin/bash

log() {
    message="$1"
    package_name="$(echo "${BASH_SOURCE[0]}" | awk -F'/' '{print $(NF-2)}')"
    spaces=$(printf '%*s' $((24 - ${#package_name})) '')
    echo "[${package_name^^}]:${spaces}${message}"
}

cargo_to_path() {
    case ":$PATH:" in
        *":$HOME/.cargo/bin:"*) ;;
        *) export PATH="$HOME/.cargo/bin:$PATH" ;;
    esac
}
