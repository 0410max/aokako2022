class Admin::KakomonreportsController < ApplicationController
  def index
    @kakomons = Kakomonreport.all.order(created_at: :desc)
    @boards = Boardreport.all.order(created_at: :desc)
    @users = Userreport.all.order(created_at: :desc)
  end
end
