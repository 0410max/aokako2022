class KakomonsController < ApplicationController
  before_action :correct_user,only: [:edit, :update]
      
  def index
    @kakomons = Kakomon.all.order(created_at: :desc)
    @comment = Comment.new
  end

  def search
    @comment = Comment.new
    if params[:sub].present?
      @kakomons = Kakomon.where('sub LIKE ?', "%#{params[:sub]}%")
    else
      @kakomons = Kakomon.none
      @no_kakomon = '該当する過去問はありません。'
    end
  end

  def new
    @kakomon = Kakomon.new
  end

  def create
    @kakomon = Kakomon.new(kakomon_params)
    @kakomon.user_id = current_user.id
    if @kakomon.save
      redirect_to user_path(@kakomon.user)
      flash[:notice] = '投稿されました'
    else
      render :new
    end
  end

  def edit
    @kakomon = Kakomon.find(params[:id])
  end

  def update
    kakomon = Kakomon(params[:id])
    kakomon.update(kakomon_params)
    if kakomon.save
      flash[:notice] = "更新されました"
      redirect_to kakomon_path(kakomon)
    else
      render :edit
    end
  end

  def destroy
    kakomon = Kakomon.find(params[:id])
    kakomon.destroy
    flash[:notice] = "削除されました"
    redirect_to kakomon_path(kakomon)
  end

  private

  def kakomon_params
    params.require(:kakomon).permit(:image,:sub,:year,:prof,:comment)
  end

  def correct_user
    @kakomon = Kakomon.find(params[:id])
    @user = @kakomon.user
    if @user == current_user 
      render :edit
    else
      redirecto_to kakomon_path(@kakomon)
    end
  end
end
