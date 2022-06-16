class Admin::KakomonreportsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @kakomons = Kakomonreport.all.order(created_at: :desc)
    @boards = Boardreport.all.order(created_at: :desc)
    @users = Userreport.all.order(created_at: :desc)
  end

  def update
    @kakomons = Kakomonreport.all.order(created_at: :desc)
    @kakomon = Kakomonreport.find(params[:id])
    @kakomon.update(status:true)
  end
end
