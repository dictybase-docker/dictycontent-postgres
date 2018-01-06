#!/bin/bash
set -xe

create_new_user_role_and_db() {
    if [ "${DICTYCONTENT_USER+defined}" -a "${DICTYCONTENT_PASSWORD+defined}" -a "${DICTYCONTENT_DB+defined}" ]
    then
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE ROLE $DICTYCONTENT_USER WITH CREATEDB LOGIN ENCRYPTED PASSWORD '$DICTYCONTENT_PASSWORD';
            CREATE DATABASE $DICTYCONTENT_DB OWNER $DICTYCONTENT_USER;
EOSQL
    fi
}

main() {
    create_new_user_role_and_db
}

main



