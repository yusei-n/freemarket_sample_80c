# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### USERテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## ニックネーム
|nickname|storing||
## メールアドレス
|mail|storing||
## パスワード７文字以上
|password|storing||
## 苗字（全角）
|Last|storing||
## 名前（全角）
|First|storing||
## 苗字 ふりがな（全角）
|Last_f|storing||
## 名前 ふりがな（全角）
|first_f|storing||
## 生年月日（年,西暦）
|Birthday_year|string||
## 生年月日（月）
|Birthday_month|string||
## 生年月日（日）
|Birthday_dey|string|

## 郵便番号
|Postal_c|storing||
## 都道府県
|Postal_p|storing||
## 市町村
|Postal_m|storing||
## 番地
|Postal_n|storing||
## 部屋番号マンション （任意）
|Post_a|storing||
## 電話番号 (任意)
|tell_n|storing||


### Productテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## 商品名
|title|string||
## 商品値段
|price|integer||
## 商品説明
|text_area|text||
## タグ:teg（外部キー）
|tag|string|foreign_key: true|


### Product_image中間テーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## 商品情報（外部キー）
|product|integer|foreign_key: true|
## 画像（複数）,(外部キー)
|image|integer|foreign_key: true|


### Tegテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## 商品情報(外部キー)
|product|integer|foreign_key: true|
## カテゴリー
|item|string||
* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
