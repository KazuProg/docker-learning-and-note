# SSH-Server on Alpine
Alpine上でSSHサーバを起動するテンプレ

超軽量なVMのようなものを作成してみる

## 簡単な機能の説明
- SSHサーバ
  - ホストキーをVolumeによって永続化
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
