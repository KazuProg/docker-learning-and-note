#!/bin/sh

# ユーザの追加＆パスワード設定
adduser -D user1
echo "user1:Password" | chpasswd

# セットアップスクリプトを削除
rm $0
