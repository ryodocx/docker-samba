#!/bin/sh

envsubst </opt/smb.conf.template >/etc/samba/smb.conf
cat /etc/samba/smb.conf

exec smbd --foreground
