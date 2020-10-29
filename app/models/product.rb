class Product < ApplicationRecord
  has_many :images
  belongs_to :user
  has_many :orders
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  # 配達の負担
  belongs_to_active_hash :delivery_burden
  # 商品の状態
  belongs_to_active_hash :product_status
  # 発送までの日時
  belongs_to_active_hash :estimated_shipping
end
