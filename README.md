# Melaka
iOS Application for Matching

## セットアップ
1. ツールのインストール
```
bundle install
brew install swiftlint
```

2. ローカルにおける環境変数の定義
- .env.defaultをルートに配置し、次の変数を定義する。
```
API_BASE_URL=xxx
```
- 環境変数の注入
```
bundle exec fastlane set_environment
```
