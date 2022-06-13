class Admin::KakomonreportsController < ApplicationController
  def index
    @kakomons = Kakomonreport.all
    @boards = Boardreport.all.order(created_at: :desc)
    @users = Userreport.all.order(created_at: :desc)
  end
end
