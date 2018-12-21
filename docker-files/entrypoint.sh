#!/bin/bash
set -e

# Setup secrets.yml
# /vars.sh

# now that we're definitely done writing configuration, let's clear out the relevant envrionment variables (so that stray "phpinfo()" calls don't leak secrets from our code)
# for e in "${envs[@]}"; do
#   unset "$e"
# done

# rake assets:precompile

exec "$@"
