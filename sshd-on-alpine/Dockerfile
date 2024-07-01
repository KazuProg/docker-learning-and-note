FROM alpine:latest

RUN apk update &&\
    apk add --no-cache openssh-server

# sshd_configを編集してホストキーの場所を変更
RUN sed -i 's|#HostKey /etc/ssh/ssh_host_rsa_key|HostKey /etc/ssh/keys/ssh_host_rsa_key|' /etc/ssh/sshd_config &&\
    sed -i 's|#HostKey /etc/ssh/ssh_host_ecdsa_key|HostKey /etc/ssh/keys/ssh_host_ecdsa_key|' /etc/ssh/sshd_config &&\
    sed -i 's|#HostKey /etc/ssh/ssh_host_ed25519_key|HostKey /etc/ssh/keys/ssh_host_ed25519_key|' /etc/ssh/sshd_config &&\
    sed -i 's|#PubkeyAuthentication yes|PubkeyAuthentication yes|' /etc/ssh/sshd_config

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
