class Card < ApplicationRecord
  belongs_to :user
  validates :card_id, presence: true, uniqueness: true
end
