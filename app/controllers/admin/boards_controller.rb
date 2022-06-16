class Admin::BoardsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @boards = Board.all.order(id: "DESC") 
        @boards = @boards.page(params[:page]).per(30)
        @kakomons = Kakomon.all.order(id: "DESC") 
    end

    def destroy
        board = Board.find(params[:id])
        if Boardreport.find_by(board_id:params[:id]).present?
            boardreport = Boardreport.find_by(board_id:params[:id])
            boardreport.destroy
        end
        board.destroy
        redirect_to request.referer
    end

    def update
        @boards = Board.all.order(id: "DESC") 
        @board = Board.find(params[:id])
        @board.update(status:true)
    end
end

