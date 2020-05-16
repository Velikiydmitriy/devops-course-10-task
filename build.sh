#!/bin/bash

set -e

echo "Source remote git repo:"
source <(curl -s https://raw.githubusercontent.com/MaksymSemenykhin/bash_scripts/master/output.sh)

print_info "$(ls -la)"

print_title "NodeJS $(node -v)"
print_title echo "NPM $(npm -v)"
print_title echo "YARN $(yarn -v)"

# Lint
#FIXME: Need check
print_info "Start linter part"
npm run linter || true

# Build
print_info "Start build"
yarn install

#Test
print_info "Start unit && functional test part"
npm run test
