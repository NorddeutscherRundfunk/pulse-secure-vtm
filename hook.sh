#!/usr/bin/env bash

deploy_challenge() {
    local DOMAIN="${1}" TOKEN_FILENAME="${2}" TOKEN_VALUE="${3}"
}

clean_challenge() {
    local DOMAIN="${1}" TOKEN_FILENAME="${2}" TOKEN_VALUE="${3}"
}

deploy_cert() {
    local DOMAIN="${1}" KEYFILE="${2}" CERTFILE="${3}" FULLCHAINFILE="${4}" CHAINFILE="${5}" TIMESTAMP="${6}"

    FULLCHAIN=`cat ${FULLCHAINFILE}`
    KEY=`cat ${KEYFILE}`

    JSON="{
        \"properties\": {
            \"basic\": {
                \"note\": \"${DOMAIN}\",
                \"private\": \"${KEY}\",
                \"public\": \"${FULLCHAIN}\",
            }
        }
    }";

    echo "$JSON" > cert.json

    curl -u usr:pwd -k --data-binary @cert.json -H "Content-Type: application/json" -X PUT https://my-vtm:9070/api/tm/5.1/config/active/ssl/server_keys/mycert

    rm cert.json
}

unchanged_cert() {
    local DOMAIN="${1}" KEYFILE="${2}" CERTFILE="${3}" FULLCHAINFILE="${4}" CHAINFILE="${5}"
}

invalid_challenge() {
    local DOMAIN="${1}" RESPONSE="${2}"
}

request_failure() {
    local STATUSCODE="${1}" REASON="${2}" REQTYPE="${3}"
}

startup_hook() {
  :
}

exit_hook() {
  :
}