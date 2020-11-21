require 'rails_helper'

describe Card do
  describe '#create' do
    
    it "user_idが空なら登録できないこと" do
      card = build(:card, user_id: nil)
      card.valid?
    end

    it "customer_idが空なら登録できないこと" do
      card = build(:card, customer_id: nil)
      card.valid?
    end

    it "card_idが空なら登録できないこと" do
      card = build(:card, card_id: nil)
      card.valid?
    end

  end
end