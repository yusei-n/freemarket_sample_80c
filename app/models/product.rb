class Product < ApplicationRecord
  has_many :images	
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :orders
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  # 配達の負担
  belongs_to_active_hash :DeliveryBurden
  # 商品の状態
  belongs_to_active_hash :ProductStatus
  # 発送までの日時
  belongs_to_active_hash :EstimatedShipping
end