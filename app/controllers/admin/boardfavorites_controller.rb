class Admin::BoardfavoritesController < ApplicationController
    def create
        @boards = Board.all
        @board = Board.find(params[:board_id])
        user = EndUser.find(1)
        favorite = user.boardfavorites.new(board_id: @board.id)
        favorite.save
    end
end
