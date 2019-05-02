#!/bin/sh

confd -onetime -backend env > /dev/null 2>&1

docker-entrypoint.sh "$@"
