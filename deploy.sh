#!/bin/bash

set -e

#input params
BRANCHNAME=$1

#Source fubctions
echo "Source remote git repo:"
source <(curl -s https://raw.githubusercontent.com/MaksymSemenykhin/bash_scripts/master/output.sh)

#Check input params
if [[ ${BRANCHNAME} =~ ^(dev|master)$ ]]; then
  print_title "Select branch: $BRANCHNAME"
else
  print_error "ERROR. BRANCH NOT CORRECT. SCRIPT STOPED"
fi

# Prereq.
DEPLOY_FOLDER ="/var/www/nodes/$BRANCHNAME"
mkdir -p "$DEPLOY_FOLDER"
print_title "Deploy folder: $DEPLOY_FOLDER"

# Deploy part
print_info "Start deploy part"

cp ./config/"$BRANCHNAME".json "$DEPLOY_FOLDER/config/"$BRANCHNAME".json"
mkdir -p "$DEPLOY_FOLDER/config"

print_info "PM2 version: $(pm2 --version)"
pm2 start

#Test
print_info "Start unit && functional test part"
npm run test
