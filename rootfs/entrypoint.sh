#!/bin/ash

# Generate host keys if not present
ssh-keygen -A

# Set root password to empty
SSH_ROOT_PASSWORD="$SSH_ROOT_PASSWORD"

# If provided as secret, get root password
if [ -z "$SSH_ROOT_PASSWORD_FILE" ]; then :; else
    if [ -f $SSH_ROOT_PASSWORD_FILE ]; then
        SSH_ROOT_PASSWORD=$(cat $SSH_ROOT_PASSWORD_FILE)
    fi
fi

# If provided, set root password
if [ -z "$SSH_ROOT_PASSWORD" ]; then :; else
    echo "root:$SSH_ROOT_PASSWORD" | chpasswd
fi

SSH_AUTHORIZED_KEY="$SSH_AUTHORIZED_KEY"

# If provided as secret, get authorized key
if [ -z "$SSH_AUTHORIZED_KEY_FILE" ]; then :; else
    if [ -f $SSH_AUTHORIZED_KEY_FILE ]; then
        SSH_AUTHORIZED_KEY=$(cat $SSH_AUTHORIZED_KEY_FILE)
    fi
fi

# If provided, set authorized key
if [ -z "$SSH_AUTHORIZED_KEY" ]; then :; else
    mkdir -p /root/.ssh
    echo "$SSH_AUTHORIZED_KEY" >> /root/.ssh/authorized_keys

    if [ -z "$SSH_ROOT_PASSWORD" ]; then
        passwd -d root
    fi
fi

# -D : Do not detach
# -e : Log to stderr
# $@ : Passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"
