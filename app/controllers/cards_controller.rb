class CardsController < ApplicationController

  require "payjp"

  def show
  end

  def new
    # カード情報が既に登録されているか確認
    @card = Card.where(user_id: current_user.id).first
    redirect_to action: "show" if @card.present?
  end

  def create
    # 秘密鍵のセット（環境変数）
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # トークンが入っているかどうか
    if params['payjp-token'].blank?
      render "new"
    else
      # PAY.JPに登録されるユーザーを作成
      customer = Payjp::Customer.create(
        description: "test",
        email: current_user.email,
        card: params["payjp-token"],
        metadata: {user_id: current_user.id}
      )

      @card = Card.new(user_id: current_user.id, payjp_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index", notice:"支払い情報の登録が完了しました"
      else
        render "new"
      end
    end
  end

  def delete
    # クレジットカード情報と PAY.JPの顧客情報も同時に削除する
    # PAY.JPから情報をする。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.payjp_id)
    customer.delete # PAY.JPの顧客情報を削除
    if @card.destroy
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除に失敗しました"
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

end
