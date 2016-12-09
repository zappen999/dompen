#!/bin/bash
# Figure out the main container name
DIR=${PWD##*/}
MAIN_SERVICE_NAME=$(cat docker-compose.yml | \
  grep ": # Main" | \
  grep -o -E '\s{2}(\w+):' | \
  grep -o -E '(\w+)')

echo "${DIR}_${MAIN_SERVICE_NAME}_1"
