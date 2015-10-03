#!/bin/bash -x
#
# A helper script for ENTRYPOINT.

set -e

if [ "$1" = 'virtualbox' ]; then
  VBoxManage list vms
fi

exec "$@"
