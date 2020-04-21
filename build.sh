#!/bin/bash

set -e

echo "Source remote git repo:"
source <(curl -s https://raw.githubusercontent.com/Velikiydmitriy/devops-course-10-task/master/build.sh)

print_info "ls -la"

print_title "NodeJS $(node -v)"
print_title echo "NPM $(npm -v)"
print_title echo "YARN $(yarn -v)"

# Build
print_info "Start build"
yarn install
