class ImagesController < ApplicationController
  def index
  end
  
  def new
  end

  def create
    @images = Image.new(image_params)

    if @images.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def image_params
    params.require(:image).permit(:text).merge(item_id:item.id)
  end
end
