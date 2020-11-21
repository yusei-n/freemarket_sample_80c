class OrdersController < ApplicationController
  before_action :set_card
  before_action :set_product
  def new
    if @product.buyer_id.present?
      redirect_to product_path(@product.id), alert: "売り切れています"
    end
    user_address = Address.where(user_id: current_user.id).first 
    @postal_address = user_address.postal_prefectures.name
    @p_numder_first3 = user_address.postal_number.to_s[0..2]
    @p_numder_last4 = user_address.postal_number.to_s[3..6]
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      card_information = customer.cards.retrieve(@card.card_id)
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
    if @card.present?
      # 購入者も、クレジットカードもある、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy',
      description: "商品名:" + @product.title,
      metadata: {nickname_id: current_user.nickname}
      )
      @order = Order.new(product_id: @product.id)
      @order.save
      # 購入時にbuyer_idをproductsに付与する
      @product.update( buyer_id: current_user.id)
      @product.save
      # トップページに戻す
      redirect_to controller: "products", action: "index"
      else
       # カード情報がなければ、買えないので戻す
      #  flash.now[:alert] = '※画像・リストの選択または入力してください。'
        flash[:notice] = "クレジットカードを登録してください"
        redirect_to action: "new"
    end
  end

  # 購入画面からのカード登録アクション
  def card_order_add
  end

  # 上記の保存アクション
  def card_registration
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].present?
      customer = Payjp::Customer.create(
        description: "ニックネーム：" + current_user.nickname, # PAY.JPの顧客情報に表示する概要。
        email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて保存。
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "new"
      else
        redirect_to action: "card_order_add",alert: "登録できませんでしました"
      end
    else
      redirect_to action: "card_order_add",alert: "トークンが生成されていません"
    end
  end
private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    end
  end
  def set_product
    @product = Product.find(params[:product_id])
  end
