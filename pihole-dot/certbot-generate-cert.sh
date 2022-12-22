#!/usr/bin/env bash

site="${1}"

docker run \
    --rm \
    -v ${PWD}/volumes/letsencrypt_data:/etc/letsencrypt \
    -it \
    certbot/certbot:latest certonly -d "${site}" --manual --preferred-challenges dns

