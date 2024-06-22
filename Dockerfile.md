# Dockerfileの書き方
よく使うコマンドの説明等


## FROM
ベースイメージの指定
```
FROM ubuntu
```


## RUN
イメージを作成する際に実行するコマンド

環境構築等を行う
```
RUN apt-get update && apt-get install -y ***
```


## CMD
コンテナを実行した際に実行されるコマンド

複数個書くことはできない。複数書いた場合は、最後のCMDのみ実行される
```
CMD ["bash"]
```


## COPY
ホストのファイルやディレクトリをコンテナにコピーする

コンテナで実行させるソースコードなど
```
COPY ./main.sh /app/
COPY ./src/ /app/
```


## ADD
> ローカル環境での tar 展開やリモート URL サポート
COPYと似ているが、圧縮ファイルで渡したり、リモートからファイルの追加ができる
```
ADD src.gz /app
ADD https://example.com/program.sh
```


## ENV
環境変数を設定
```
ENV TOKEN=abcdefg
```
※トークンやパスワードなどの機密情報はDockerfileではなく、コンテナ実行の際に渡すべき


## WORKDIR
作業ディレクトリの指定
```
WORKDIR /app
```


## EXPOSE
コンテナがLISTENするポートを指定
```
EXPOSE 80
```


## VOLUME
ボリュームにマウントする(よくわかってない...)
```
VOLUME /app
```


## 参考
* [【Docker初心者】Dockerfileの書き方について](https://qiita.com/gon0821/items/f9e3bcbb6cb01d4ef7fa)
* [Dockerfile を書くベストプラクティス](https://docs.docker.jp/develop/develop-images/dockerfile_best-practices.html)
* [Dockerfile の ADD と COPY の違いを結論から書く](https://qiita.com/YumaInaura/items/1647e509f83462a37494)
* [Dockerfileからボリュームを作成する①](https://www.infra-linux.com/menu-docker3/dokerfile1-volume/)
