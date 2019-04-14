FROM alpine:3.9

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apk add samba-server gettext

COPY entrypoint.sh /opt/entrypoint.sh
COPY smb.conf /opt/smb.conf.template

ENV \
    SMBCONF_WORKGROUP='WORKGROUP' \
    SMBCONF_SERVERSTRING='%h server (Samba, Alpine)' \
    SMBCONF_SHARENAME='Shared Folder' \
    SMBCONF_COMMENT='share'

EXPOSE 139 445
CMD ["sh","/opt/entrypoint.sh"]
