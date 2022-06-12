class Admin::BoardsController < ApplicationController
    def update
        board = Board.find(params[:id])
        board.update(is_display:false)
        redirect_to request.referer
    end
end
