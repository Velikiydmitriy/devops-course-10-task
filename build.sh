#!/bin/bash

set -e

echo "Source remote git repo:"
source <(curl -s https://github.com/MaksymSemenykhin/bash_scripts/blob/master/output.sh)

print_info "ls -la"

print_title "NodeJS $(node -v)"
print_title echo "NPM $(npm -v)"
print_title echo "YARN $(yarn -v)"

# Build
print_info "Start build"
yarn install
