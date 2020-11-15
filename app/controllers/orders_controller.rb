class OrdersController < ApplicationController
  before_action :set_card, :set_product
  def show
  end

  def new
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      card_information = customer.cards.retrieve(@card.card_id)
      # @exp_month = card_information.exp_month.to_s
      # @exp_year = card_information.exp_year.to_s.slice(2,3)
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

  def create
    # すでに購入されていないか？
    if @card.blank?
      # カード情報がなければ、買えないので戻す
      flash.now[:alert] = '※画像・リストの選択または入力してください。'
      redirect_to action: "new"
    else
      # 購入者も、クレジットカードもある、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy',
      description: "商品名:" + @product.title,
      metadata: {nickname_id: current_user.nickname}
      )
      # 売り切れの場合、productの情報をアップデートして売り切れに。
      if @product.update(user_id: current_user.id)
        flash[:notice] = '購入しました'
        redirect_to controller: 'products', action: 'index'
      else
        flash[:notice] = '購入に失敗しました'
        redirect_to controller: 'products', action: 'show', id: @product.id
      end
    end
  end

  def delete
  end

private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
  def set_product
    @product = Product.find(params[:product_id])
  end
end
