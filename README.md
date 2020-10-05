# README

# Userテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### ニックネーム
|nickname|string|null: false|
### メールアドレス
|mail|string|null: false|
### パスワード７文字以上
|password|string|null: false|

# Userアソシエーション
｜has_many: products|
｜has_many: cards|
|has_one: address|


# addressテーブル（商品配送情報）
｜Column｜Type｜Options｜
|-------|-----|-------|
### ユーザーと紐付ける（外部キー）
|user_id|integer|foreign_key: true|
### 苗字（全角）
|last_name|string|null: false|
### 名前（全角）
|first_name|string|null: false|
### 苗字 ふりがな（全角）
|last_name_hurigana|string|null: false|
### 名前 ふりがな（全角）
|first_name_hurigana|string|null: false|
### 生年月日（年：西暦,月,日）
|birthday|data||
---　アクティブハッシュ---(カラム設定しない)
### 郵便番号(外部キーモデルから)
|postal_number_id|integer|foreign_key: true|
### 都道府県（外部キーモデルから）
|postal_prefectures_id|integer|foreign_key: true|
### 市町村（外部キーモデルから）
|postal_municipalities_id|integer|foreign_key: true|
--- アクティブハッシュここまで---
### 番地
|postal_address|string|null: false|
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
|title|string|null: false|
### 商品値段
|price|integer|null: false|
### 商品説明
|explanation|text|null: false|
--- アクティブハッシュ---（カラム設定しない）
### 配送料負担関係（外部キーモデルから）
|delivery_burden_id|integer|foreign_key: true,null: false|
### 商品状態 (外部キーモデルから)
|product_Status_id|integer|foreign_key: true,null: false|
### 発送日目安 (外部キーモデルから)
|estimated_shipping_id|integer|foreign_key: true,null: false|
--- アクティブハッシュここまで---


### Productアソシエーション
 ｜has_many: images|
 |has_many: users|
 |belongs_to: order|
 |has_many: product_categorys|
 |has_many: categorys through:product_categorys|
 


# Orderテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### ユーザー情報（配送情報含む）（外部キー）
|user_id|integer|foreign_key: true|
### 商品情報（ニックネームを除く）（外部キー）
|product_id|integer|foreign_key: true|


## Orderアソシエーション
|belongs_to: cored|
|belongs_to: product|

### imageテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## 商品情報（外部キー）
|product_id|integer|foreign_key: true|
## 画像（複数）
|image|text||

# imageアソシエーション
|has_many: products|

---アクティブハッシュ---
# Category(カテゴリー)テーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 商品情報(外部キー)
|product_id|integer|foreign_key: true, null: false|
### カテゴリー（外部キーモデル）
|category_id|integer|foreign_key: true, null: false|
---アクティブハッシュここまで---

# Categoryアソシエーション
|has_many:product_categorys|
|has_many:producrs through:product_categorys|


# Product_Category中間テーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 商品情報（外部キー）
|product_id|integer|foreign_key: true|
### カテゴリー（外部キー）
|category_id|integer|foreign_key: true|

# Product_Categoryアソシエーション
｜belongs_to: product|
|belongs_to: category|




# Statesテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
###　ステータス状態
|states_under|integer|foreign_key: true|


# statesアソシエーション
｜has_many: product_states|
｜has_many: products through:product_states|

# product_statesテーブル
### 商品情報（外部キー）
|product_id|integer|foreign_key: true|
### スターテス情報（外部キーモデル）
|states_id|integer|foreign_key: true|

# product_statesアソシエーション
｜belongs_to: products|
｜belongs_to: states|

# Cardsテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 名前（ローマ字）
|user_name_romazi|storing|null: false|
### クレジットカード番号
|customer_id|string|null: false|
### クレジットカードキー
|card_id|string|null: false|


# Cardsアソシエーション
|belongs_to: order|
|belongs_to: user|


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
