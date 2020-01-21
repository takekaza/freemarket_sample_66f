class ItemsController < ApplicationController
  def index
    @item = Item.includes(:user)
    @image = Image.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, [images_attributes: [:image]])
  end

end
