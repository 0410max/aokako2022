class Admin::BoardreportsController < ApplicationController
  def index
    @boards = Boardreport.all.order(created_at: :asc)
    @users = Userreport.all.order(created_at: :desc)
  end
end

