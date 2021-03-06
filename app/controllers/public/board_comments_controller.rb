class Public::BoardCommentsController < ApplicationController
    before_action :authenticate_end_user!
    def create
        @board = Board.find(params[:board_id])
        @comments = @board.board_comments.order(created_at: :desc)
        comment = current_end_user.board_comments.new(comment_params)
        comment.board_id = @board.id
        comment.end_user_id = current_end_user.id
        comment.save
        @comment = BoardComment.new
    end

    def destroy
        BoardComment.find(params[:id]).destroy
        @board = Board.find(params[:board_id])
        @comments = @board.board_comments.order(created_at: :desc)
        @comment = BoardComment.new
    end
    private

    def comment_params
        params.require(:board_comment).permit(:comment)
    end
end
