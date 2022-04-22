class KakomonsController < ApplicationController
  before_action :correct_user,only: [:edit, :update]
      
  def index
    @kakomons = Kakomon.page(params[:page]).per(10).order(created_at: :desc)
    @comment = Comment.new
    @kakomonsCount = current_user.kakomons.count
    @report = Report.new
  end

  def search
    @comment = Comment.new
    if params[:sub].present?
      @kakomons = Kakomon.where('sub LIKE ?', "%#{params[:sub]}%")
      @kakomons = @kakomons.page(params[:page]).per(10).order(created_at: :desc)
    else
      @kakomons = Kakomon.none
    end
  end

  def show
    @kakomon = Kakomon.find(params[:id])
    @comments = @kakomon.comments.order(created_at: :desc)
    @comment = Comment.new
    @report = Report.new

    @number2 = current_user.number.slice(1)
    @number3 = current_user.number.slice(2)
    @number4 = current_user.number.slice(3)
    @number5 = current_user.number.slice(4)
    @number6 = current_user.number.slice(5)
    @number7 = current_user.number.slice(6)
    @number8 = current_user.number.slice(7)
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

  def destroy
    kakomon = Kakomon.find(params[:id])
    kakomon.destroy
    flash[:notice] = "削除されました"
    redirect_to user_path(current_user)
  end

  private

  def kakomon_params
    params.require(:kakomon).permit(:image1,:image2,:image3,:sub,:year,:prof,:comment)
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
