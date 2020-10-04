# README

# USERテーブル
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
｜has_many: pay_cords|
|belongs_to: address|


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
### 郵便番号
|Postal_number|storing||
### 都道府県
|Postal_Prefectures|storing||
### 市町村
|Postal_Municipalities|storing||
### 番地
|Postal_address|storing||
### 部屋番号マンション （任意）
|Post_apartment|storing||
### 電話番号 (任意)
|tell_number|storing||

### addressアソシエーション
｜has_many: products|
|belongs_to: users|



# Productテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 商品名
|title|string||
### 商品値段
|price|integer||
### 配送料負担関係
|delivery_burden|string||
### 商品説明
|explanation|text||
### 商品状態 (フロントで処理する)
|product_Status|string||
### 発送日目安 (フロントで処理する)
|Estimated shipping |string||
### タグ:teg（外部キー）
|tag|string|foreign_key: true|

### Productアソシエーション
 ｜has_many: product_images|
 |has_many: product_tags|
 |has_many: tags through:product_tags|


### imageテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
## 商品情報（外部キー）
|product|integer|foreign_key: true|
## 画像（複数）,(外部キー)
|image|integer|foreign_key: true|

# imageアソシエーション
|belongs_to: product|


# Tagテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### 商品情報(外部キー)
|product|integer|foreign_key: true|
### カテゴリー
|item|string||

# Tagアソシエーション
｜has_many: products|
｜has_many: product_tags|
|has_many: products through:product_tags|

# j_payテーブル
｜Column｜Type｜Options｜
|-------|-----|-------|
### クレジットカード番号
|Credit number|string|null: false|
### クレジットカードキー
|Credit key|string|null: false|
### 名前（ローマ字）
|user_name_romazi|storing|null: false|






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
