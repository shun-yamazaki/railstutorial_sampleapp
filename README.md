# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、次の教材で作られたサンプルアプリケーションです。   
[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
[Michael Hartl](http://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードはMITライセンスとBeerwareライセンスのもとで公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```bash
bundle install --without production
```

※updateしてくださいとエラーが出る場合は、エラーメッセージにしたがって RubyGems をアップデートしてから、
再度インストールを試してください。

```bash
bundle update
```

その後、データベースへのマイグレーションを実行します。

```bash
rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```bash
rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```bash
rails server
```

詳しくは、[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
を参考にしてください。
