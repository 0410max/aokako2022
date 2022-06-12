class Admin::BoardsController < ApplicationController
    def destroy
        board = Board.find(params[:id])
        board.destroy
        redirect_to request.referer
    end
end
