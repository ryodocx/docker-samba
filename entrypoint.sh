#!/bin/sh

mkdir -p /share
envsubst </opt/smb.conf.template >/etc/samba/smb.conf

exec smbd \
    --foreground \
    --no-process-group \
    --log-stdout
