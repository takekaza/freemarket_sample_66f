class ItemsController < ApplicationController
  before_action :set_item, except: [:index,:new, :create]
  def index
    @item = Item.includes(:user)
    @image = Image.all   
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
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end


  def show
   
    @images = Image.find(params[:id])
    @brand = Brand.find(params[:id])
    @category = Category.find(params[:id])
    @user_items = Item.where(user_id: @item.user.id).where.not(id: params[:id]).limit(6)

 

  end



  

  private
  def item_params
    params.require(:item).permit(:name,:text,:price,:condition,:berser,:way,:region,:date,:size, :price, images_attributes: [:url,:_destroy,:id],category_attributes: [:name],brand_attributes: [:name]).merge(user_id: current_user.id)


  end

  def set_item
    @item =Item.find(params[:id])
  end


end