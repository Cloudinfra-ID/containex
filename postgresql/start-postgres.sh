#!/usr/bin/env sh

rm -f /var/lib/postgresql/data/.gitignore
/usr/local/bin/docker-entrypoint.sh postgres
