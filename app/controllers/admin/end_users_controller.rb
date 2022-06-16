class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = EndUser.page(params[:page]).per(30).order(created_at: :desc)
  end

  def show
    @user = EndUser.find(params[:id])
    @boards = @user.boards.order(created_at: :desc)
    @kakomons = @user.kakomons.order(created_at: :desc)    
  end

  def search
    if params[:dep].present?
      @users = EndUser.where('dep LIKE ?', "#{params[:dep]}")
      @users = @users.page(params[:page]).per(30)
    else
      @users = EndUser.none
    end
  end

  def clear
    @users = EndUser.page(params[:page]).per(30).order(created_at: :desc)
  end

  def unsubscribe
    user = EndUser.find(params[:id])
    user.update(is_deleted: true)
    redirect_to request.referer
  end

end

