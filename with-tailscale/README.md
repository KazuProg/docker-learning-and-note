# DockerコンテナをTailscaleから接続できるようにする
コンテナのサービスをTailscaleで共有したい場合などに使う

SambaコンテナをTailscale経由で友人と共有して共有NASを構築するなど...


## `.env.tailscale`の例
```
TS_AUTHKEY=[Tailscaleから取得したAuthKey]
```


## 参考
* [DevContainer（Docker Compose）をTailnet（Tailscale）に接続するには](https://zenn.dev/takeyuwebinc/articles/39d6417a735d94)
