# Dockerfile でパッケージの no-cache インストール

## apt

```
RUN apt update &&\
    apt install -y *** &&\
    apt clean &&\
    rm -rf /var/lib/apt/lists/*
```

`apt autoremove -y`を実行している記事があったが、真っ新な Docker イメージからビルドしているので不要なパッケージはないのでは？

apt と apt-get の違いが気になったので調べたら、apt の方が依存解決など優れているらしい

- [APT と APT-GET にはどのような違いがありますか?](https://aws.amazon.com/jp/compare/the-difference-between-apt-and-apt-get/)

## pip

```
RUN pip install --no-cache-dir -U pip &&\
    pip install --no-cache-dir -r requirements.txt
```

## 参考

- [Docker 環境別 no cache install](https://qiita.com/hikaruna/items/e049e53b0147e37db977)
- [APT と APT-GET にはどのような違いがありますか?](https://aws.amazon.com/jp/compare/the-difference-between-apt-and-apt-get/)
- [機械学習な dockerfile を書くときに気をつけとくと良いこと](https://nykergoto.hatenablog.jp/entry/2020/07/25/%E6%A9%9F%E6%A2%B0%E5%AD%A6%E7%BF%92%E3%81%AAdockerfile%E3%82%92%E6%9B%B8%E3%81%8F%E3%81%A8%E3%81%8D%E3%81%AB%E6%B0%97%E3%82%92%E3%81%A4%E3%81%91%E3%81%A8%E3%81%8F%E3%81%A8%E8%89%AF%E3%81%84%E3%81%93)
- [Python アプリ用の優れた Dockerfile の書き方](https://www.pybootcamp.com/blog/how-to-write-dockerfile-python-apps/)
