class Admin::BoardsController < ApplicationController
  def index
    @reports = Boardreport.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
  end
end 
