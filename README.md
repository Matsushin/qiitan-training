# README

Railsトレーニングアプリ

### Version
- ruby 2.5.3
- rails 5.2.3
- MySQL 5.7.22

## 課題
### 課題①
- home/indexビューにコメント(Comment)レコード3件取得してコメントの本文とコメントに紐づく記事のタイトルを一覧で表示させる
  - レコードはコンソールから追加するものとする
  - モデルの関係
    - articles -< comments
    
### 課題②
- 記事(Article)の登録画面を作成しよう
  - 記事のタイトル、本文を入力して登録できるように
  - タイトルと本文は空入力だとエラーになるように
  - フォームはGemのsimple_formを利用する
  
### 課題③
- gemのactive_interactionを使って記事を登録できるようにしよう
  - 以下のような構成にする
    - app/services/application_service.rb
    - app/services/articles/create.rb
    
### 課題④
- 記事を更新できるようにしよう
  - 以下のような構成にする
    - app/services/articles/update.rb
    
### 課題⑤
- 記事を削除できるようにしよう
  - 以下のような構成にする
    - app/services/articles/delete.rb

## 初期設定

### インストール
- [Docker for Mac](https://www.docker.com/docker-mac) or [Docker for Windows](https://docs.docker.com/docker-for-windows/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### アプリ初期設定
```
$ docker-compose build
$ docker-compose run web bundle install
$ docker-compose run web yarn install
```

### データベース初期設定
```
$ docker-compose run web bundle exec rails db:create
$ docker-compose run web bundle exec rails db:migrate
$ docker-compose run web bundle exec rails db:seed
```

## 起動・終了

### 起動コマンド

以下のコマンドで起動します。

```
$ docker-compose up
```

JSのコンパイルに多少時間がかかります。数秒まって、http://localhost:3000/ で確認します。

デバッガーを起動する場合は、

```
$ docker-compose run -p 3000:3000 web bundle exec rails server -b 0.0.0.0
$ docker-compose run -p 3035:3035 web bundle exec ./bin/webpack-dev-server
```

### 終了
Ctrl+C
たまにゴミが残るので、  rm tmp/pid/server.pid を削除する必要があるかも

### DBにmigration
必要なら以下を実行
```
$ docker-compose run web bundle exec rails db:migrate
```