#!/bin/sh

set -e

mkdir -p /share
envsubst </opt/smb.conf.template >/etc/samba/smb.conf

testparm -v

exec smbd \
    --foreground \
    --no-process-group \
    --log-stdout
