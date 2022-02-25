class UsersController < ApplicationController
  before_action :correct_user,only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @kakomons = @user.kakomons.order(created_at: :desc)
    @comment = Comment.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    if @user.save
      flash[:notice] = "プロフィールが保存されました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
   end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end
