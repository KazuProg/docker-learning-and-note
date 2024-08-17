# docker-compose.ymlについて



## 開発に役立つやつ
```
services:
  app:
    build: .
    #restart: always
    command: sleep infinity
    env_file: .env
    volumes:
      - ./var:/var/lib/app
      - ./src:/app

```
`command: sleep infinity`で、コンテナを起動しっぱなしにする

`volumes: ./src:/app`で、ソースコードがそのままコンテナへ反映

```
# コンテナを起動
docker compose up -d
# コンテナへ入る
docker compose exec app sh
```

## イメージを強制リビルド
```
docker compose build --no-cache
```
