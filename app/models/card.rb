class Card < ApplicationRecord
  belongs_to :user
  # validates :card_id, presence: { クレジットカードを登録して下さい。 }
end
