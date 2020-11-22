class Product < ApplicationRecord
  belongs_to :user
  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :orders,dependent: :destroy
  belongs_to :category
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  # 配達の負担
  belongs_to_active_hash :DeliveryBurden
  
  # 商品の状態
  belongs_to_active_hash :ProductStatus
  
  # 発送までの日時
  belongs_to_active_hash :EstimatedShipping

  # 発送元の地域
  belongs_to_active_hash :PostalPrefectures
  
  validates :images, presence: {message: "を1枚以上登録してください"}
  validates :delivery_burden_id, presence: { message: "を選択してください"}
  validates :estimated_shipping_id, presence: { message: "を選択してください"}
  validates :product_status_id, presence: { message: "を選択してください"}
  validates :title, presence: true,length: { maximum: 40 }
  validates :price, presence: true,inclusion: {in: 300..9999999}
  validates :explanation, presence: true,length: { maximum: 1000 }
  validates :category_id, presence: { message: "を選択してください"}
  validates :postal_prefectures_id,presence: { message: "を選択してください"}
  

end 