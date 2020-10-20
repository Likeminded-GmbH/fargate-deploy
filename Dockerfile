# Container image that runs your code
FROM alpine:3.12

RUN apk add bash aws-cli wget libc6-compat
RUN wget -q https://github.com/turnerlabs/fargate/releases/download/v0.9.0/ncd_linux_amd64 -O /usr/bin/fargate && chmod +x /usr/bin/fargate

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
