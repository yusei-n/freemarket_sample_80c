# README

# Userテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### ニックネーム
|nickname|storing||
### メールアドレス
|mail|storing||
### パスワード７文字以上
|password|storing||

# Userアソシエーション
｜has_many: products|
｜has_many: J_pays|
|belongs_to: address|
｜has_many: order_history|


# addressテーブル（商品配送情報）
｜Column｜Type｜Options｜
|-------|-----|-------|
### 苗字（全角）
|Last_name|storing||
### 名前（全角）
|First_name|storing||
### 苗字 ふりがな（全角）
|Last_name_hurigana|storing||
### 名前 ふりがな（全角）
|first_name_hurigana|storing||
### 生年月日（年,西暦）
|Birthday_year|string||
### 生年月日（月）
|Birthday_month|string||
### 生年月日（日）
|Birthday_dey|string|
---　アクティブハッシュ---(カラム設定しない)
### 郵便番号
|Postal_number|storing||
### 都道府県
|Postal_Prefectures|storing||
### 市町村
|Postal_Municipalities|storing||
--- アクティブハッシュここまで---
### 番地
|Postal_address|storing||
### 部屋番号マンション （任意）
|Post_apartment|storing||
### 電話番号 (任意)
|tell_number|storing||

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
---　アクティブハッシュ---（カラム設定しない）
### 配送料負担関係
|delivery_burden|string||
### 商品状態 (フロントで処理する)
|product_Status|string||
### 発送日目安 (フロントで処理する)
|Estimated shipping |string||
--- アクティブハッシュここまで---
### カテゴリー:category（外部キー）
|category|integer|foreign_key: true|

### Productアソシエーション
 ｜has_many: images|
 |has_many: product_categorys|
 |has_many: categorys through:product_categorys|
 ｜has_many: product_states|
｜has_many: states through:product_states|


# Orderテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### ユーザー情報（配送情報含む）（外部キー）
|user|integer|foreign_key: true|
### クレジットカード情報（外部キー）
|J_pay|integer|foreign_key: true|
### 商品情報（ニックネームを除く）（外部キー）
|product|integer|foreign_key: true|
### 注文履歴
|order_history|integer||
### スターテス情報（取引中）（外部キー）
|stats|integer|foreign_key: true|

## Orderアソシエーション
|belongs_to: user|
|belongs_to: j_pay|
|belongs_to: product|
|belongs_to: order_history|
|belongs_to: stats|

### imageテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## 商品情報（外部キー）
|product|integer|foreign_key: true|
## 画像（複数）
|image|text||

# imageアソシエーション
|belongs_to: product|

---アクティブハッシュ(カラム設定しない)---
# Category(カテゴリー)テーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 商品情報(外部キー)
|product|integer|foreign_key: true|
### カテゴリー
|item|string||
---アクティブハッシュここまで---

# Categoryアソシエーション
｜has_many: product_categorys|
|has_many: products through:product_categorys|

# Product_Category中間テーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 商品情報（外部キー）
|product|integer|foreign_key: true|
### カテゴリー（外部キー）
|category|integer|foreign_key: true|

# Product_Categoryアソシエーション
｜has_many: products|
|has_many: categorys|


# J_payテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### クレジットカード番号
|Credit number|string|null: false|
### クレジットカードキー
|Credit key|string|null: false|
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

---アクティブハッシュ---
# Statesテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### productとの中間テーブル（外部キー）
|product_states|integer|foreign_key: true|
###　ステータス状態（出品中）
|States_under|||
###　ステータス状態（取引中）
|States_transaction|||
###　ステータス状態（売却済）
|States_sale|||

# statesアソシエーション
｜has_many: product_states|
｜has_many: products through:product_states|
---アクティブハッシュここまで---


# product_statesテーブル
### 商品情報（外部キー）
|product|integer|foreign_key: true|
### スターテス情報（外部キー）
|states|integer|foreign_key: true|

# product_statesアソシエーション
｜has_many: products|
｜has_many: states|





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
