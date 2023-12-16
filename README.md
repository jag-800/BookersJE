# JE研修 - 実装内容

## [devise](https://github.com/heartcombo/devise)  (Gem)
- 目標：Bookers2にパスワードの変更機能・日本語化を実装する
- ユーザー認証機能実装Gem
  - カリキュラムで使用しているもの以外にも多くの機能が含まれている。
  - ゆえにドキュメント量は多いが、日本語の参考資料も多い。根気よく読み進めよう。
  - [和訳Qiita](https://qiita.com/gakkie/items/6ef70c0788c3cbff81ee)：大筋は把握できるが、情報古めなので注意が必要

## [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on) (Gem)
- 目標：Bookers2にタグ追加機能の実装
- タグ検索機能を実装する際に使用されるGem。JavaScriptも絡んでくるのである程度JSデバッグの知識が必要かも。

## [ransack](https://github.com/activerecord-hackery/ransack) (Gem)
- 目標：複数条件を用いた検索機能の実装
  - [完成イメージ&参考になる日本語記事](https://qiita.com/nishina555/items/2c1f8bae980e426519bc)
- キーワード検索機能を実装する際に使用されるGem。モデルの記述を簡略化できるので、使用する受講生は多い。

## [slick](https://kenwheeler.github.io/slick/) (JS Library)
- 目標：Bookers2にslickを導入し、画像スライドショーを組み込む
  - 読み込みはCDNを使用
  - JavaScriptの記述はapp/assets/javascriot/application.jsに記述
  - 組み込む場所の指定なし

## [Google Maps Platform](https://developers.google.com/maps/documentation?hl=ja)（API）
- 目標：Bookers2のマイページに自分の住所の地図を導入
  - userモデルに郵便番号、住所を格納するカラムを追加
  - 新規登録画面に郵便番号を入力するフォームを追加
  - 郵便番号を入力後、郵便番号に対応する住所を住所フォームに自動入力（jpostal.jp、Gem jp_prefectureを使用）
  - 他人の詳細画面では住所を表示しないこと
  - Google Map APIを使用すること
  - APIトークンはGem dotenv-railsを使用し、環境変数として扱うこと
