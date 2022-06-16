class Admin::BoardsController < ApplicationController
    def index
        @boards = Board.all.order(id: "DESC") 
        @boards = @boards.page(params[:page]).per(30)
        @kakomons = Kakomon.all.order(id: "DESC") 
    end

    def destroy
        board = Board.find(params[:id])
        boardreport = Boardreport.find_by(board_id:params[:id])
        board.destroy
        boardreport.destroy
        redirect_to request.referer
    end

    def update
        @boards = Board.all.order(id: "DESC") 
        @board = Board.find(params[:id])
        @board.update(status:true)
    end
end