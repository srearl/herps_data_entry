#!/bin/bash
set -e

##############################################################################################
# RAILS SECRETS VARS
##############################################################################################

set_secret() {
  key="$1"
  value="$2"
  sed "s|$key|$value|g" -i "/app/config/secrets.yml"
}

set_secret '$$SECRET_KEY_BASE$$' $SECRET_KEY_BASE
set_secret '$$DB_HOST$$' $DB_HOST
set_secret '$$DB_PORT$$' $DB_PORT
set_secret '$$DB_NAME$$' $DB_NAME
set_secret '$$DB_USER$$' $DB_USER
set_secret '$$DB_PASS$$' $DB_PASS
set_secret '$$DB_TEMPLATE$$' $DB_TEMPLATE
set_secret '$$DB_SCHEMA_SEARCH_PATH$$' $DB_SCHEMA_SEARCH_PATH
