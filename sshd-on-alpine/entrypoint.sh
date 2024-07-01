#!/bin/sh

# ユーザー情報を永続化
if [ ! -f /user_data/passwd ]; then
    cp /etc/passwd /user_data/passwd
fi
if [ ! -f /user_data/shadow ]; then
    cp /etc/shadow /user_data/shadow
fi
if [ ! -f /user_data/group ]; then
    cp /etc/group /user_data/group
fi
ln -sf /user_data/passwd /etc/passwd
ln -sf /user_data/shadow /etc/shadow
ln -sf /user_data/group /etc/group

# ユーザの追加＆パスワード設定
# ユーザ情報を , で分割し、ループ処理
IFS=','; for user_info in $USERS_LIST; do
    # ユーザ情報を : で分割し、変数に代入
    IFS=':'; set -- $user_info
    username=$1
    password=$2
    uid=$3

    # ユーザが存在しない場合のみ処理をする
    if ! id "$username" >/dev/null 2>&1; then
        # ユーザ作成(uidの指定は任意)
        if [ -n "$uid" ]; then
            adduser -D --uid "$uid" "$username"
        else
            adduser -D "$username"
        fi

        # パスワード設定
        echo "$username:$password" | chpasswd >/dev/null 2>&1

        echo "User $username created."
    fi
done

# SSHホストキーがなければ生成
if [ ! "$(ls -A /etc/ssh/keys/)" ]; then
  ssh-keygen -A
  mv /etc/ssh/ssh_host_* /etc/ssh/keys/
fi

# SSHサーバーを起動
/usr/sbin/sshd -D &

# その他何か必要なものを起動
tail -f /dev/null
