class ItemsController < ApplicationController
  before_action :set_item, except: [:index,:new, :create,:done,:search]

  def index
    @item = Item.includes(:user)
    @images = Image.all
  end

  def new
    @item=Item.new
    @item.images.new
    @item.build_category
    @item.build_brand
  end


  def create
    @item= Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    @item=Item.find(params[:id])

  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id && @item.destroy

    else
      render :index
    end
  end


  def show

    @images = Image.find_by(params[:id])
    @brand = Brand.find(params[:id])
    @category = Category.find(params[:id])
    @user_items = Item.where(user_id: @item.user.id).where.not(id: params[:id]).limit(6)
  end

  def buy
    # @user_items = Item.find(user_id: current_user.id)
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

  def done
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:name,:text,:price,:condition,:berser,:way,:region,:date,:size, :price, images_attributes: [:url,:_destroy,:id],category_attributes: [:name],brand_attributes: [:name]).merge(user_id: current_user.id)
  end


  def set_item
    # binding.pry
    @item =Item.find(params[:id])
  end

end