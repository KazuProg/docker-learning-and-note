FROM alpine:latest

RUN apk update &&\
    apk add --no-cache openssh-server &&\
    ssh-keygen -A

COPY setup.sh /usr/local/bin/setup.sh
RUN sh /usr/local/bin/setup.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
