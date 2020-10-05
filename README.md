# README

# Userテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### ニックネーム
|nickname|string||
### メールアドレス
|mail|string||
### パスワード７文字以上
|password|string||

# Userアソシエーション
｜has_many: products|
｜has_many: J_pays|
|belongs_to: address|
｜has_many: order_historys|


# addressテーブル（商品配送情報）
｜Column｜Type｜Options｜
|-------|-----|-------|
### 苗字（全角）
|Last_name|string||
### 名前（全角）
|First_name|string||
### 苗字 ふりがな（全角）
|Last_name_hurigana|string||
### 名前 ふりがな（全角）
|first_name_hurigana|string||
### 生年月日（年：西暦,月,日）
|birthday|data||
---　アクティブハッシュ---(カラム設定しない)
### 郵便番号
|postal_number|string||
### 都道府県
|postal_prefectures|string||
### 市町村
|postal_municipalities|string||
--- アクティブハッシュここまで---
### 番地
|postal_address|string||
### 部屋番号マンション （任意）
|post_apartment|string||
### 電話番号 (任意)
|tell_number|string||

### addressアソシエーション
｜has_many: products|
|belongs_to: user|



# Productテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 商品名
|title|string||
### 商品値段
|price|integer||
### 商品説明
|explanation|text||
--- アクティブハッシュ---（カラム設定しない）
### 配送料負担関係
|delivery_burden|string||
### 商品状態 (フロントで処理する)
|product_Status|string||
### 発送日目安 (フロントで処理する)
|estimated shipping |string||
--- アクティブハッシュここまで---


### Productアソシエーション
 ｜has_many: images|
 


# Orderテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### ユーザー情報（配送情報含む）（外部キー）
|user|integer|foreign_key: true|
### クレジットカード情報（外部キー）
|j_pay|integer|foreign_key: true|
### 商品情報（ニックネームを除く）（外部キー）
|product|integer|foreign_key: true|
### 注文履歴
|order_history|integer||


## Orderアソシエーション
|belongs_to: user|
|belongs_to: j_pay|
|belongs_to: product|
|belongs_to: order_history|

### imageテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## 商品情報（外部キー）
|product|integer|foreign_key: true|
## 画像（複数）
|image|text||

# imageアソシエーション
|belongs_to: product|



# J_payテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### クレジットカード番号
|credit number|string|null: false|
### クレジットカードキー
|credit key|string|null: false|
### 名前（ローマ字）
|user_name_romazi|storing|null: false|

# J_payアソシエーション
|belongs_to: Order|

# Order_history（注文履歴）テーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### ユーザー情報（外部キー）
|user|integer|foreign_key: true|
### 商品情報（外部キー）
|product|integer|foreign_key: true|
### 商品配送情報（外部キー）
|address|integer|foreign_key: true|

# Order_historyアソシエーション
｜has_many: users|
|belongs_to: order|

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
