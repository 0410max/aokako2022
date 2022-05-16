class Public::NoboardsController < ApplicationController
  def index
    @boards = Board.page(params[:page]).per(30).order(created_at: :desc)
  end
end
