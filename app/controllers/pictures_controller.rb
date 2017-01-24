class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path,  notice: "写真を投稿しました！"
    NoticeMailer.sendmail_picture(@picture).deliver
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end


  def update
    @picture = Picture.find(params[:id])
    @picture.update(pictures_params)
    if @picture.save
      redirect_to pictures_path,　notice: "写真を更新しました！"
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
