# README

### アプリケーション概要
TECH CAMPの最終課題（チーム開発）にて制作したフリマアプリです。メルカリを参考にしました。
２週間に一度スプリントレビューを行い、成果及び進捗の共有を行っていました。
また、スプリントレビュー後には、次回スプリントで行うTODOについて話し合うスプリント計画ミーティングを行っていました。
それとは別で、週に1〜2回ミーティングを行い進捗の共有や進め方について話し合う時間を設け、開発を進めていきました。

### 実装機能一覧
- ユーザー新規登録、ログイン機能（ウィザード形式）
- 商品出品機能
- 商品編集機能
- 商品削除機能
- カテゴリ一覧
- 商品購入機能（Pay.jp使用）
- バリデーションの単体テスト（Rspec使用）

## 使用技術
### 言語
Ruby/Haml/SCSS/Javascript

### ワークフレーム
Ruby on Rails

### インフラ
AWS EC2/AWS S3

### データベース
MySQL

### 開発方法
スクラムを用いたアジャイル開発


## DB設計
#### active_hashを除く外部キーを使用するカラムにreferences型を使用します

## Userテーブル
|Column|Type|Options|
|-------|-----|-------|
|nickname|string|null: false|
|email|string|null: false,default: ""|
|password|string|null: false,default: ""|

### Usersアソシエーション
- has_many: products
- has_many: cards
- has_one: address
- accepts_nested_attributes_for: address

## Addressテーブル（商品配送情報）
|Column|Type|Options|
|-------|-----|-------|
|user|reference|foreign_key: true, null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_hurigana|string|null: false|
|first_name_hurigana|string|null: false|
|birthday|data|null: false,|
|postal_number|integer|null: false|
|postal_prefectures_id|integer|null: false|
|postal_municipalities|integer|null: false|
|postal_address|string|null: false|
|post_apartment|string||
|tell_number|string||

### Addressアソシエーション
- belongs_to: user, optional: true
- belongs_to_active_hash: postal_prefectures



## Productsテーブル
|Column|Type|Options|
|-------|-----|-------|
|user|references|foreign_key: true|
|title|string|null: false|
|price|integer|null: false|
|explanation|text|null: false|
|category_id|integer|null: false|
|delivery_burden_id|integer|null: false|
|product_Status_id|integer|null: false|
|estimated_shipping_id|integer|null: false|
|postal_prefectures_id|integer|null: false|
|brand|text||
|buyer_id|integer||

### Productsアソシエーション
- has_many: images, dependent: destroy
- belongs_to: user
- has_many: orders, dependent: destroy
- belongs_to: category
- belongs_to_active_hash: DeliveryBurden
- belongs_to_active_hash: ProductStatus
- belongs_to_active_hash: EstimatedShipping
- belongs_to_active_hash: PostalPrefectures
- accepts_nested_attributes_for: images,allow_destroy: true

## Ordersテーブル
|Column|Type|Options|
|-------|-----|-------|
|product|references|foreign_key: true,null: false|

### Ordersアソシエーション
- belongs_to: product


## Imagesテーブル
|Column|Type|Options|
|-------|-----|-------|
|product|references|foreign_key: true, null: false|
|image|string|null: false|

### Imagesアソシエーション
- belongs_to: product, optional: true

## Categories(カテゴリー)テーブル
|Column|Type|Options|
|-------|-----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Categoriesアソシエーション
- has_many:products
- has_ancestry


## Cardsテーブル
|Column|Type|Options|
|-------|-----|-------|
|user|references|foreign_key: true, null: false|
|customer_id|string|null: false|
|card_id|string|null: false|


### Cardsアソシエーション
- belongs_to: user