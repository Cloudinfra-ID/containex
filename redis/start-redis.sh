#!/usr/bin/env sh

REDIS_CONF_FILE="/etc/redis.conf"

if [ ! -f ${REDIS_CONF_FILE} ]; then
  echo "requirepass ${REDIS_PASSWORD}" > ${REDIS_CONF_FILE}
fi

/usr/local/bin/docker-entrypoint.sh \
    redis-server ${REDIS_CONF_FILE} \
    --save 60 1 \
    --loglevel warning \
