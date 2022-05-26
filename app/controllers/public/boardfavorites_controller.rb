class Public::BoardfavoritesController < ApplicationController
    def create
        @board = Board.find(params[:board_id])
        favorite = current_end_user.boardfavorites.new(board_id: @board.id)
        @board.create_notification_thanks!(current_end_user)
        favorite.save
    end

    def destroy
        @board = Board.find(params[:board_id])
        favorite = current_end_user.boardfavorites.find_by(board_id: @board.id)
        favorite.destroy
    end
end
