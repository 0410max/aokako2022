class Admin::EndUsersController < ApplicationController
  def index
    @users = EndUser.page(params[:page]).per(30).order(created_at: :desc)
  end

  def show
  end
end
