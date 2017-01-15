class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
  end

  def edit
    @picture = Picture.find(params[:id])
  end


  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    if @picture.save
      redirect_to pictures_path,  notice: "写真を更新しました！"
    else
      render 'edit'
    end
  end

  def show
   @picture = Picture.find(params[:id])
  end


  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "写真を削除しました"
  end


  private
    def pictures_params
      params.require(:picture).permit(:image, :content)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
  end
