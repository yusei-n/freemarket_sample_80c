class Product < ApplicationRecord
  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :orders,dependent: :destroy
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  # 配達の負担
  belongs_to_active_hash :DeliveryBurden
  
  # 商品の状態
  belongs_to_active_hash :ProductStatus
  
  # 発送までの日時
  belongs_to_active_hash :EstimatedShipping

  validates :user_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :estimated_shipping_id, presence: true
  validates :product_status_id, presence: true
  validates :title, presence: true,length: { maximum: 40 }
  validates :price, presence: true,inclusion: {in: 300..9999999}
  validates :explanation, presence: true,length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :postal_prefectures_id,presence: true
  
end 