#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

if [ $# -ne 1 ]; then
    echo "Call with exactly one target"
    exit 1
fi

target="$1"
if [ ! -f "$SCRIPT_DIR/$target/install.sh" ]; then
    echo "No such target: $target"
    exit 1
fi

already_installed=()
flattened_dependencies=()
reversed_dependencies=()

get_dependency_list() {
    package_name="$1"

    flattened_dependencies+=("$package_name")

    readarray -t packages < "$SCRIPT_DIR/$package_name/deps"
    for pkg in "${packages[@]}"; do
        if [ "${pkg:0:1}" != "#" ]; then
            get_dependency_list "$pkg"
        fi
    done
}

install_dependencies() {
    for pkg in "${reversed_dependencies[@]}"; do
        if [[ ! " ${already_installed[*]} " =~ [[:space:]]${pkg}[[:space:]] ]]; then
            # whatever you want to do when array doesn't contain value
            if "$SCRIPT_DIR/$pkg/install.sh"; then
                already_installed+=("$pkg")
            else
                echo "Failed to install [${pkg^^}]"
                exit 1
            fi
        fi
    done
}

get_dependency_list "$target"

# Reverse the flattened array
length=${#flattened_dependencies[@]}
for (( i=$((length - 1)); i>=0; i-- )); do
    reversed_dependencies+=("${flattened_dependencies[i]}")
done

install_dependencies
