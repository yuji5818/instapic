class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @blog = Picture.new(picture_params)
    else
      @blog = Picture.new
    end
  end


  private
    def pictures_params
      params.require(:picture).permit(:title, :content)
    end

     def set_picture
      @picture = Picture.find(params[:id])
     end
  end
end
