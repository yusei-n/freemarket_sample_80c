 # README

## active_hashを除く外部キーを使用するカラムにreferences型を使用します

## Userテーブル
|Column|Type|Options|
|-------|-----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
OK
### Usersアソシエーション
- has_many: products
- has_many: cards
- has_one: address
OK

## addressテーブル（商品配送情報）
|Column|Type|Options|
|-------|-----|-------|
|user_id|reference|foreign_key: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_hurigana|string|null: false|
|first_name_hurigana|string|null: false|
|birthday|data|null: false※アクティブハッシュ|
|postal_number|integer|null: false|
|postal_prefectures_id|integer|null: false※アクティブハッシュ|
|postal_municipalities|integer|null: false|
|postal_address|string|null: false|
|post_apartment|string||
|tell_number|string||
OK
### addressアソシエーション
- belongs_to: user
OK


## Productsテーブル

|Column|Type|Options|
|-------|-----|-------|
|user_id|references|foreign_key: true, null: false|
|title|string|null: false|
|price|integer|null: false|
|explanation|text|null: false |
|delivery_burden_id|integer|f,null: false※アクティブハッシュ|
|product_Status_id|integer|null: false※アクティブハッシュ|
|estimated_shipping_id|integer|null: false※アクティブハッシュ|
OK
### Productsアソシエーション
- has_many: images
- belongs_to: user
- has_many: orders
- belongs_to: category
OK

## Ordersテーブル

|Column|Type|Options|
|-------|-----|-------|
|product_id|references|foreign_key: true,null: false|
OK

### Ordersアソシエーション
- belongs_to: product
OK

### imagesテーブル

|Column|Type|Options|
|-------|-----|-------|
|product_id|references|foreign_key: true|
|image|text||
OK
### imagesアソシエーション
- belongs_to: product
OK
## categories(カテゴリー)テーブル
|Column|Type|Options|
|-------|-----|-------|
|item|string|null: false※アクティブハッシュ|
OK
### categoriesアソシエーション
- has_many:producrs
OK



## Cardsテーブル
|Column|Type|Options|
|-------|-----|-------|
|user_id|references|foreign_key: true, null: false|
|customer_id|string|null: false|
|card_id|string|null: false|


### Cardsアソシエーション
- belongs_to: user