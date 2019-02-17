FROM alpine:3.9
LABEL maintainer="Touchify <dev@touchify.co> (@touchify)"

EXPOSE 22

COPY rootfs /

RUN apk add --no-cache openssh && \
    sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
    chmod 500 /entrypoint.sh && \
    echo "root:root" | chpasswd

ENTRYPOINT ["/entrypoint.sh"]