class Product < ApplicationRecord
  has_many :images
  belongs_to :user
  has_many :orders
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :product_status
  belongs_to_active_hash :estimated_shipping
end
