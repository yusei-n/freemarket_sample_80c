class CardsController < ApplicationController
  require "payjp"
  before_action :set_card
  def index
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      card_information = customer.cards.retrieve(@card.card_id)
      @exp_month = card_information.exp_month.to_s
      @exp_year = card_information.exp_year.to_s.slice(2,3)
      @card_info_last4 = card_information.last4
      @card_brand = card_information.brand
        case @card_brand
        when "Visa"
          @card_src = "visa.png"
        when "JCB"
          @card_src = "jcb.png"
        when "MasterCard"
          @card_src = "master-card.png"
        when "American Express"
          @card_src = "american_express.png"
        when "Diners Club"
          @card_src = "dinersclub.png"
        when "Discover"
          @card_src = "discover.png"
        end
      else
    end
  end

  def new 
  end

  def create 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new",alert: "トークンが生成されていません"
    else
      customer = Payjp::Customer.create(
        description: "ニックネーム：" + current_user.nickname, 
        email: current_user.email,
        card: params['payjp-token'], 
        metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "index",alert: "登録できませんでした"
      end
    end
  end

  def destroy 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.destroy
    if @card.destroy 
      redirect_to action: "index"
    else 
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end
  private
  def set_card 
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
