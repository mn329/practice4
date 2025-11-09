# practice4

ショッピングアプリのUIプロトタイプ。

## リファクタリング概要
- `HomeView`をヘッダー・検索バー・カルーセル・ボトムナビなどの内部ウィジェットに分割して責務を明確化。
- `TitleListView`はカードウィジェットのリストを受け取るAPIへ変更し、同じ見た目で複数セクションを柔軟に配置できるようにした。
- `CardWidget`はタイトル・価格・画像パスを引数で受け取れるよう拡張し、既定値で従来のカード表示を再現。

## 主要ウィジェット
- `HomeView`: Home画面全体を構築。初期のレイアウトを保ちながら、共通部品をプライベートウィジェットとして切り出した。
- `TitleListView`: セクションタイトル付きの横スクロールリストを表示。`cards`プロパティで任意のウィジェット群を渡せる。
- `CardWidget`: 商品カードを構築。デフォルト値でMacBookのダミーデータを描画しつつ、差し替えも容易。
- `_PromoCarousel`: `CarouselSlider`を使って5枚のスライドを原作通りに表示する内部ウィジェット。

## 開発メモ
- 商品画像は`asset/images/`配下を利用。新規追加時は`pubspec.yaml`のアセット設定を更新。
- カルーセルは`carousel_slider`パッケージを使用。スライドの内容は`HomeView._carouselSlides`で管理。
- `See All`アクションはデフォルトで空ハンドラを使用。必要に応じてコールバックを差し込む。

## Getting Started

Flutterのセットアップが済んでいない場合は[公式ドキュメント](https://docs.flutter.dev/)を参照してください。

```
flutter pub get
flutter run
```
