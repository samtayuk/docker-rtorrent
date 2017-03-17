#!/bin/sh

set -o pipefail

function log {
        echo `date` $ME - $@
}

log "Remove stale session lock"
rm -Rf /data/.session/*

exec "$@"
