FROM alpine:3.9

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apk add samba gettext

COPY entrypoint.sh /opt/entrypoint.sh
COPY smb.conf /opt/smb.conf.template

ENV \
    SMBCONF_WORKGROUP='WORKGROUP' \
    SMBCONF_SERVER_NAME='Samba Server' \
    SMBCONF_WORKGROUP='WORKGROUP' \
    _=_

EXPOSE 445
CMD ["sh","/opt/entrypoint.sh"]
