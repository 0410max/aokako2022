class Public::NoboardsController < ApplicationController

  def index
    @boards = Board.find(Boardfavorite.group(:board_id).order('count(board_id) desc').pluck(:board_id))
    @boards = Kaminari.paginate_array(@boards).page(params[:page]).per(30)
  end

end
