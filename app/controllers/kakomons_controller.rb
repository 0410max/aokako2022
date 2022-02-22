class KakomonsController < ApplicationController
  def index
    @kakomons = Kakomon.all.order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @kakomon = Kakomon.new
  end

  def create
    @kakomon = Kakomon.new(kakomon_params)
    @kakomon.user_id = current_user.id
    if @kakomon.save
      redirect_to user_path(@kakomon)
      flash[:notice] = '投稿されました'
    else
      render :new
    end
  end

  def edit
    @kakomon = Kakomon.find(params[:id])
    if @kakomon.user === current_user
      render :edit
    else
      redirect_to :index
    end
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
    params.require(:kakomon).permit(:image,:year,:prof,:comment)
  end
end
