class Admin::BoardreportsController < ApplicationController
  def index
    @boards = Boardreport.all.order(created_at: :desc)
    @boards = @boards.page(params[:page]).per(30)
    @users = Userreport.all.order(created_at: :desc)
  end

  def update
    @boards = Boardreport.all.order(created_at: :desc)
    @board = Boardreport.find(params[:id])
    @board.update(status:true)
  end
end

