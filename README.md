# README

## active_hashを除く外部キーを使用するカラムにreferences型を使用します

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

## addressテーブル（商品配送情報）
|Column|Type|Options|
|-------|-----|-------|
|user|reference|foreign_key: true, null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_hurigana|string|null: false|
|first_name_hurigana|string|null: false|
|birthday|data|null: false,※アクティブハッシュ|
|postal_number|integer|null: false|
|postal_prefectures_id|integer|null: false※アクティブハッシュ|
|postal_municipalities|integer|null: false|
|postal_address|string|null: false|
|post_apartment|string||
|tell_number|string||

### addressアソシエーション
- belongs_to: user, optional: true
- belongs_to_active_hash: postal_prefectures



## Productsテーブル
|Column|Type|Options|
|-------|-----|-------|
|user|references|foreign_key: true|
|title|string|null: false|
|price|integer|null: false|
|explanation|text|null: false|
|category_id|integer|null: false※アクティブハッシュ|
|delivery_burden_id|integer|null: false※アクティブハッシュ|
|product_Status_id|integer|null: false※アクティブハッシュ|
|estimated_shipping_id|integer|null: false※アクティブハッシュ|
|category_id|integer|null: false|
|postal_prefectures_id|integer|null: false※アクティブハッシュ|
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


## imagesテーブル
|Column|Type|Options|
|-------|-----|-------|
|product|references|foreign_key: true, null: false|
|image|string|null: false|

### imagesアソシエーション
- belongs_to: product, optional: true

## categories(カテゴリー)テーブル
|Column|Type|Options|
|-------|-----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### categoriesアソシエーション
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