class Product < ApplicationRecord
  has_many :images	
  validates :images, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :orders
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  # 配達の負担
  belongs_to_active_hash :DeliveryBurden
  validates :DeliveryBurden, presence: true
  # 商品の状態
  belongs_to_active_hash :ProductStatus
  validates :ProductStatus, presence: true
  # 発送までの日時
  belongs_to_active_hash :EstimatedShipping
  validates :EstimatedShipping, presence: true

  validates :title, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
end