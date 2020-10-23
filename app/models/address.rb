class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postal_prefectures
  belongs_to :user, optional: true

  validates :last_name, :first_name, :last_name_hurigana, :first_name_hurigana, :birthday, :postal_number, :postal_prefectures_id, :postal_municipalities, :postal_address, presence: true
end
