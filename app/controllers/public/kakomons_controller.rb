class Public::KakomonsController < ApplicationController
  before_action :authenticate_end_user!,except: [:index,:show]
  def index
    @kakomons = Kakomon.page(params[:page]).per(30).order(created_at: :desc)
    @comment = Comment.new
    @report = Kakomonreport.new
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
    @report = Kakomonreport.new

    @number2 = current_end_user.number.slice(1)
    @number3 = current_end_user.number.slice(2)
    @number4 = current_end_user.number.slice(3)
    @number5 = current_end_user.number.slice(4)
    @number6 = current_end_user.number.slice(5)
    @number7 = current_end_user.number.slice(6)
    @number8 = current_end_user.number.slice(7)
  end

  def new
    @kakomon = Kakomon.new
  end
  
  def create
    @kakomon = Kakomon.new(kakomon_params)
    @kakomon.end_user_id = current_end_user.id
    if @kakomon.save
      redirect_to end_user_path(@kakomon.end_user)
      flash[:notice] = '投稿されました'
    else
      render :new
    end
  end

  def destroy
    kakomon = Kakomon.find(params[:id])
    kakomon.destroy
    flash[:notice] = "削除されました"
    redirect_to end_user_path(current_end_user)
  end

  private

  def kakomon_params
    params.require(:kakomon).permit(:image1,:image2,:image3,:sub,:year,:prof,:comment)
  end
end
