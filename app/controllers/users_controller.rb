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
  end

  def update
    current_user.update(user_params)
    if current_user.save
      flash[:notice] = "更新されました"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

end
