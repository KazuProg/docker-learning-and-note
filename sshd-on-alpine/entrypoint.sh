#!/bin/sh

# SSHサーバーを起動
/usr/sbin/sshd -D &

# その他何か必要なものを起動
tail -f /dev/null
