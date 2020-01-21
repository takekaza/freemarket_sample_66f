class ItemsController < ApplicationController
  def index
    @item = Item.includes(:user)
    @image = Image.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # 保存に成功した時の処理
      redirect_to root_path
    else
      # 保存に失敗した時の処理
      render :new
    end
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
