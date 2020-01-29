class PurchaseController < ApplicationController
  require 'payjp'

  def index
    # @user_items = Item.find(user_id: current_user.id)
    @item =Item.find_by(params[:id])
    @user = User.find_by(params[:id])
    @address = Address.find_by(user_id: current_user.id)
    @image = Image.find_by(params[:id])
    @card = Card.where(user_id: current_user.id).first

    if @card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:pay_jp][:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @item =Item.find_by(params[:id])
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:pay_jp][:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  @item.destroy
  redirect_to action: 'done' #完了画面に移動
  end

end
