# Supported tags and respective Dockerfile links

*  [`7.9.0`, `7.9`, `7`, `latest` (Dockerfile)](https://github.com/touchifyapp/docker-ssh/blob/master/Dockerfile)

This image is updated via [pull requests to the `touchifyapp/docker-ssh` GitHub repo](https://github.com/touchifyapp/docker-ssh/pulls).

# [OpenSSH](https://www.openssh.com/): Open Secure SHell.

![OpenSSH logo](https://www.openssh.com/images/openssh.gif)

`OpenSSH` (Secure SHell). The SSH protocol uses encryption to secure the connection between a client and a server. All user authentication, commands, output, and file transfers are encrypted to protect against attacks in the network. 

## How to use

The container can be used as a simple container or a swarm service.

### Default configuration

The following case uses the default configuration. To connect the server, use `ssh root@localhost -p 2222` (password: `root`).

```
$ docker run -dt \
$   --name ssh \
$   -p 2222:22 \
$   touchifyapp/ssh
```

### Custom root password

You can also specify a custom root password.

#### Environment variable

You can specify root password using `SSH_ROOT_PASSWORD` environment variable:

```
$ docker run -dt \
$   --name ssh \
$   -p 2222:22 \
$   -e SSH_ROOT_PASSWORD=mypassword \
$   touchifyapp/ssh
```

#### Docker secret

You can specify root password using Docker `secret` and `SSH_ROOT_PASSWORD_FILE` environment variable:

```
# Create secret
$ printf "secretpassword" | docker secret create ssh_password -

# Run service
$ docker service create \
$   --name ssh \
$   --publish 2222:22 \
$   --secret ssh_password \
$   --env SSH_ROOT_PASSWORD_FILE=/run/secrets/ssh_password \
$   touchifyapp/ssh
```

### Using authorized key

You can provide your own authorized key.

#### Environment variable

You can specify root password using `SSH_AUTHORIZED_KEY` environment variable:

```
$ docker run -dt \
$   --name ssh \
$   -p 2222:22 \
$   -e SSH_AUTHORIZED_KEY="$(cat ~/.ssh/id_rsa.pub)" \
$   touchifyapp/ssh
```

#### Docker secret

You can specify root password using Docker `secret` and `SSH_AUTHORIZED_KEY_FILE` environment variable:

```
# Create secret
$ docker secret create ssh_authorized_key ~/.ssh/id_rsa.pub

# Run service
$ docker service create \
$   --name ssh \
$   --publish 2222:22 \
$   --secret ssh_authorized_key \
$   --env SSH_AUTHORIZED_KEY_FILE=/run/secrets/ssh_authorized_key \
$   touchifyapp/ssh
```

## License

View [license information](https://github.com/touchifyapp/docker-ssh/blob/master/LICENSE) for the software contained in this image.

## Supported Docker versions

This image is officially supported on Docker version 1.13+.

Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

## User Feedback

### Documentation

Documentation for this image is stored in [the `touchifyapp/docker-ssh` GitHub repo](https://github.com/touchifyapp/docker-ssh).
Be sure to familiarize yourself with the repository's README.md file before attempting a pull request.

### Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/touchifyapp/docker-ssh/issues).

### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/touchifyapp/docker-ssh/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.