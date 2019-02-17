FROM alpine:3.9
LABEL maintainer="Touchify <dev@touchify.co> (@touchify)"

EXPOSE 22

RUN apk add --no-cache openssh && \
    sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd

COPY rootfs /

ENTRYPOINT ["/entrypoint.sh"]