class ImagesController < ApplicationController
  def new
  end

  def create
    @image = Image.new(image_params)

  if @image.save
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
