class CategoriesController < ApplicationController
  def index
    @images = Image.find_by(params[:id])
    @category = Category.find(params[:id])
    @item = Item.find(params[:id])
  end
end
