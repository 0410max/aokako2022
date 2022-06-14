class Admin::BoardsController < ApplicationController
    def destroy
        board = Board.find(params[:id])
        boardreport = Boardreport.find_by(board_id:params[:id])
        board.destroy
        boardreport.destroy
        redirect_to request.referer
    end
end
