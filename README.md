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
    
### 課題⑥
- 記事を検索/並び替えできるようにしよう
  - 以下のような構成にする
    - app/services/search/articles.rb
    
### 課題⑦
- 記事の詳細を見れるようにしよう
  - 記事のID、タイトル、本文、コメント数、作成日時、更新日時が見れるように
    - 本文は入力した改行が反映して表示されるように
  - コメント一覧も見れるように
    - コメントのID、本文、作成日時、更新日時が見れるように
    
### 課題⑧
- ユーザ登録/ログインをできるようにしよう
  - gemのdeviseを使う
  - ユーザ登録ができるように
  - ログインができるように
  - サイドメニューからログアウトができるように
  - ログイン後ヘッダーにログインユーザのメールアドレスを表示するように
  - ログインしていなければどの画面にアクセスしてもログイン画面にリダイレクトするように

### 課題⑨
- 記事にユーザを紐づけれるようにしよう
  - 記事を登録するとログインしているユーザが作成者となるように
  - 記事一覧と詳細画面に作成者のアドレスを表示する
  
### 課題⑩
- 記事に画像を登録できるようにしよう
  - 記事の登録・更新画面で画像を添付できるように
    - ActiveStorageを利用する
  - 登録した画像は記事詳細画面で表示する 
  
### 課題11
- Rspecが通るようにバリデーションを設定しよう
  - 以下のコマンドを実行して全て通るように `app/models/article.rb` にバリデーションを追加する
    - `docker-compose run web bundle exec rspec ./spec/models/article_spec.rb` 

### 課題12
- コールバックを設定しよう
  1. 以下のコマンドを実行して通るように `app/models/article.rb` の `create_comment` メソッドに処理を書く
    - `docker-compose run web bundle exec rspec ./spec/models/article_spec.rb:149` 
  2. `articles` テーブルの `str_value` カラムにセットされた値が保管する前に小文字になるようにする
    - `app/models/article.rb` にコールバックを追加する
    - `spec/models/article_spec.rb` にテストを追加する
    
### 課題13
- タグをまとめて設定しよう
  - 記事登録・編集画面からタグを複数まとめて登録できるように
    - gemのcocoonの機能を利用する
  - 登録したタグは記事一覧・詳細画面で表示する

### 課題15
- 記事一覧APIを実装してみよう
  - ブラウザで `http://localhost:3000/api/v1/articles` のURLを入力したらJSON形式で記事一覧情報が取得できるように
  - 取得する1件の情報は以下の通り
    - id -> 記事ID
    - title -> 記事タイトル
    - short_body -> 記事本文(20字を超えたら文末は「...」とする)
    - author_email -> 記事作成者のアドレス
      - **delegate機能を使って実現するように**
    - comment_count -> 記事についたコメント数
    - creted_on -> 記事の作成日付(例:2019-10-12)
  - その他
    - 1ページ10件取得するように。パラメータとしてpage=2の場合は2ページ目の情報が取得できるように

### 課題16
- 記事登録、参照、更新、削除APIを実装しよう
  - 以下のようなコマンド例でAPIが利用できるように
  
作成  
```
$ curl -H "Accept: application/json" -H "Content-Type: application/json" \
-X POST -d '{"article": {"title": "記事タイトル", "body": "記事本文", "user_id": 1, "tags_attributes": {"0": {"name": "タグ名", "display_order": "1", "_destroy": "false"}}} }' \
http://localhost:3000/api/v1/articles | jq .
```

詳細
```
$ curl http://localhost:3000/api/v1/articles/1 | jq .
```

更新
```
$ curl -H "Accept: application/json" -H "Content-Type: application/json" \
-X PATCH -d '{"article": {"title": "新記事タイトル", "body": "新記事本文", "tags_attributes": {"0": {"name": "タグ名", "display_order": "1", "_destroy": "false"}}} }' \
http://localhost:3000/api/v1/articles/1 | jq .
```

削除
```
$ curl -X DELETE http://localhost:3000/api/v1/articles/1 | jq .
```
 
### 課題17
- BootstrapやAdminLTEのクラスを使って新しく記事一覧画面を作成しよう
  - URLは「http://localhost:3000/front/articles」となるように
  - 以下のクラスは必ず使う
  - [AdminLTE](https://adminlte.io/themes/AdminLTE/documentation)
    - `box`
  - [Bootstrap3](http://bootstrap3.cyberlab.info/components)
    - `breadcrumb`
    - `alert`
    - `col-md-xx`
    - `panel`
    - `label`

### 課題19
- Vue.jsで記事詳細画面を作成しよう
  - URLは「http://localhost:3000/vue/articles/:id」となるように
  - 記事詳細情報はAPIは以下URLを利用する
    - 「http://localhost:3000/api/v1/articles/:id」
  - 以下項目を表示するようにする
    - ID/タイトル/本文/作成者/画像/コメント数/タグ/作成日時/更新日時
  - コメント一覧は表示しない

### 課題20
- Vue.jsで記事登録画面を作成しよう
  - URLは「http://localhost:3000/vue/articles/new」となるように
  - 記事登録APIは以下URLを利用する
      - 「http://localhost:3000/api/v1/articles」
  - 以下項目を登録できるようにする
    - タイトル/本文
  - ユーザIDの取得方法
    - `app/views/vue/articles/new.html.haml` にdata属性を利用してユーザIDをセットしてVue側に受け渡すようにする
  - Vue.jsでのComponentとしては以下ファイルを作成する
    - `app/webpack/components/article/NewArticleForm.vue`
  - その他
    - `store` は利用しないで良い

### 課題21
- Vue.jsで記事編集画面を作成しよう
  - URLは「http://localhost:3000/vue/articles/:article_id/edit」となるように
  - 記事編集APIは以下URLを利用する
      - 「http://localhost:3000/api/v1/articles/:article_id」
  - 以下項目を更新できるようにする
    - タイトル/本文
  - 記事IDの取得方法
    - `app/views/vue/articles/edit.html.haml` にdata属性を利用して記事IDをセットしてVue側に受け渡すようにする
  - Vue.jsでのComponentとしては以下ファイルを作成する
    - `app/webpack/components/article/EditArticleForm.vue`
  - その他
    - 編集処理で `store` は利用しないで良い
 
### 課題22
- Vue.jsで記事一覧画面から記事を削除できるようにしよう
  - 記事削除APIは以下URLを利用する
      - 「http://localhost:3000/api/v1/articles/:article_id」
  - 記事IDの取得方法
    - `app/views/vue/articles/edit.html.haml` にdata属性を利用して記事IDをセットしてVue側に受け渡すようにする
  - Vue.jsでのComponentは以下ファイルを更新する
    - `app/webpack/components/article/Articles.vue`
  - その他
    - 削除処理で `store` は利用しないで良い 
    - 削除が成功したらAPIを利用して一覧情報を取得して画面の表示を更新する。画面遷移はなし。
    - 画面の表示を更新後に `vue-toasted` を使ってトースト表示させる
      - 文言は「削除しました」

### 課題23
- エラー表示のコンポーネント化しよう
  - 「components/shared/Errors.vue」
  - 「NewArticleForm」と「EditArticleForm」で共通化したコンポーネントを使うように
- momentを使って記事一覧画面の作成日の表示形式を変更しよう
  - 2019-11-01 -> 2019/11/01 09:34:46 
  - created_onではなくcreated_atを利用する
  - [参考](https://qiita.com/Sa2Knight/items/092a764679f960de81c9)
- ストアを利用しよう
  - 登録・更新・削除

### 課題24
- フォームのサブミットボタンをコンポーネント化しよう
  - 「components/shared/SubmitButton.vue」
  - 「NewArticleForm」と「EditArticleForm」で共通化したコンポーネントを使うように
  - 「$emit」使ってしてボタン押下時の処理はそれぞれ親コンポーネントに書く
  - 「slot」を使ってボタンの文言(登録する/更新する)は親コンポーネントに書く

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