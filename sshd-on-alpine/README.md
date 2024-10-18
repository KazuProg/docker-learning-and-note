# SSH-Server on Alpine

Alpine 上で SSH サーバを起動するテンプレ

超軽量な VM のようなものを作成してみる

## 簡単な機能の説明

- SSH サーバ
  - ホストキーを Volume によって永続化
  - 公開鍵認証も有効化
- ユーザの作成
  - コンテナ実行時に環境変数を基にユーザを作成
  - ユーザが既に存在している場合は何もしない
- ユーザ情報の永続化
  - `/ets/[passwd,shadow,group]`を永続化
  - コンテナ再実行後もユーザ情報を保持
- ホームディレクトリの永続化
  - コンテナ再実行後もデータを保持

## 環境変数(`.env`ファイル)の例

```
# ユーザとパスワードを記述
USERS_LIST=user:password
# uidも指定
USERS_LIST=user:password:1000
# 複数ユーザの作成
USERS_LIST=user1:password1,user2:password2
```

## 参考

- [How to install OpenSSH server on Alpine Linux (including Docker)](https://www.cyberciti.biz/faq/how-to-install-openssh-server-on-alpine-linux-including-docker/)
- [Docker Alpine コンテナを利用した SSH サーバーの構築](https://qiita.com/YasuhiroABE/items/f5679937fddec2628f00)
- [Alpine Linux でユーザやグループを追加・修正・削除する](https://amaya382.hatenablog.jp/entry/2017/04/10/104759)
- [Alpine Linux で ユーザー/グループ を 追加/削除/一覧 する 方法](https://garafu.blogspot.com/2019/07/operate-user-group-on-alpine.html)
- [Linux ユーザ名が存在するかどうかチェックするやつ（これでいいのかな）](https://gist.github.com/ysugimoto/5899918)
- [シェルスクリプトでユーザーの存在確認](https://teratail.com/questions/51642)
- [SSH 公開鍵認証で接続するまで](https://qiita.com/kazokmr/items/754169cfa996b24fcbf5)
- [Chat-GPT](https://chatgpt.com/)
