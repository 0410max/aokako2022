class Admin::UserreportsController < ApplicationController
  def index
    @users = Userreport.all.order(created_at: :desc)
  end

  def update
    @users = Userreport.all.order(created_at: :desc)
    @user = Userreport.find(params[:id])
    @user.update(status:true)
  end
end
